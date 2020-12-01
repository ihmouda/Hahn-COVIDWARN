//
//  MapViewController.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/27/20.
//

import UIKit
import MapKit
import CoreLocation

/// Component Size
private struct ComponentSize {
    static let minHeightOfRegulationView: CGFloat           = 300
}

class MapViewController: UIViewController {
    
    /// Map View
    @IBOutlet private(set) weak var mapView: MKMapView!
    
    /// Table view
    @IBOutlet private(set) weak var tableView: UITableView!
    
    /// Regulations view
    @IBOutlet private(set) weak var regulationsView: UIView!
    
    /// Button View
    @IBOutlet private(set) weak var button: UIButton!
    
    /// Regulations Title Label
    @IBOutlet private(set) weak var regulationsTitleLabel: UILabel!
    
    /// Activity Indicator
    @IBOutlet private(set) weak var activityIndicator: UIActivityIndicatorView!
    
    /// Map Annotation Image View
    @IBOutlet private(set) weak var mapAnnotationImageView: UIImageView!
    
    /// Table View Height Constraint
    @IBOutlet private(set) weak var regulationViewHeightConstraint: NSLayoutConstraint!
    
    /// Location Manager
    let locationManager = CLLocationManager()
    
    /// View Model
    private(set) var viewModel: MapViewModel!
    
    /// Feature Data
    var featureData: FeatureItemAttribute!
    
    /// Timer
    var timer: Timer?
    
    /// User Location
    var userLocation: CLLocation?
 
    /// Is Expandable
    private var isExpandableRegualtionView: Bool = false
    
    /**
     View Did Load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init view model.
        self.viewModel = MapViewModel(regulations: COVIDRegulation.allGeneralRegulations)
        
        // Setup table view / views
        self.setupViews()
        self.setupTableView()
        
        // request location
        self.LocationManagerRequestLocation()
    }
    
    /**
     Setup  Views
     */
    private func setupViews() {
                
        self.regulationsTitleLabel.text = NSLocalizedString("general.regulations", comment: "Show more")
        self.mapAnnotationImageView.image = mapAnnotationImageView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.mapAnnotationImageView.tintColor = COVIDSignal.none.color
        self.regulationsView.isHidden = true
        
        self.button.setTitle(NSLocalizedString("general.showMore", comment: "Show more"), for: UIControl.State.normal)
        self.button.layer.cornerRadius = 15
        self.button.clipsToBounds = true
        
        // Draw right/left top corners
        let path = UIBezierPath(roundedRect: CGRect(x: self.regulationsView.bounds.origin.x, y: self.regulationsView.bounds.origin.y, width: self.regulationsView.bounds.size.width, height: UIScreen.main.bounds.height - 100),
                                byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight],
                                cornerRadii: CGSize(width: 15, height:  15))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.regulationsView.layer.mask = maskLayer
    }
    
    /**
     Prepare For
     - Parameter segue: UI Storyboard Segue.
     - Parameter sender: Sender.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check identifier
        if segue.identifier == "showFeautreData" {
            
            // set featureData parameter in destination controller
            if let destination = segue.destination as? FeatureDataViewController {
                destination.featureData = self.featureData
            }
        }
    }
    
    /**
     Init Feature Service Data Timer
     */
    func initFeatureServiceDataTimer() {
        
        // Timer with 10 minutes
        self.timer = Timer.scheduledTimer(timeInterval: 600.0, target: self, selector: #selector(self.handleGetDataRepeator), userInfo: nil, repeats: true)
    }
    
    /**
     Handle Get Data Repeator
     */
    @objc func handleGetDataRepeator() {
        
        // get user location
        guard let userLocation = self.userLocation, timer != nil else { return }
        
        // get data
        self.queryForFeatureServiceDataAtLocation(userLocation.coordinate)
      
        // set region
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        mapView.setRegion(region, animated: false)
    }
 
    /**
     Stop Feature Service Data Timer
     */
    func stopFeatureServiceDataTimer() {
        self.timer?.invalidate()
    }
    
    /**
     Setup Table View
     */
    private func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.isScrollEnabled = false
        
        // Register cells
        TitleHeaderFooterView.registerHeaderView(in: self.tableView)
    }
    
    /**
     Location Manager Request Location
     */
    private func LocationManagerRequestLocation(){

        // location manager request authorization
        self.locationManager.requestWhenInUseAuthorization()
        
        // check is service is enabled
        guard CLLocationManager.locationServicesEnabled() else { return }
        
        // request location
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestLocation()
        
    }
    
    /**
     Show More Action
     - Parameter sender: Sender.
     */
    @IBAction func showMoreAction(_ sender: Any) {
        
        // Update boolean is expandable regulation view or not
        self.isExpandableRegualtionView = !self.isExpandableRegualtionView
        
        // Enable table view scrolling in case regulation view is expandable.
        self.tableView.isScrollEnabled = self.isExpandableRegualtionView
        
        // Get height
        let height: CGFloat = self.isExpandableRegualtionView ? UIScreen.main.bounds.height - 100 : ComponentSize.minHeightOfRegulationView
 
        // Disable show more/less button
        self.button.isEnabled = false

        // Update regulation view height
        self.regulationViewHeightConstraint.constant = height
        UIView.animate(withDuration:  1.0, delay: 0, usingSpringWithDamping: 10.0, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            guard let strongSelf = self else {return}
            
            // Enable show more/less button
            strongSelf.button.isEnabled = true
            
            // Update button title
            strongSelf.button.setTitle(NSLocalizedString(strongSelf.isExpandableRegualtionView ? "general.showLess" : "general.showMore", comment: "Show less/ More"), for: UIControl.State.normal)
        })
        
    }
    
    /**
     Update Information View
     */
    func updateInformationView() {
        
        // guard check signal type
        guard self.viewModel.signal != .none else {
            
            // hide information view
            self.regulationsView.isHidden = true
            self.mapAnnotationImageView.tintColor = self.viewModel.signal.color

            return
        }
        
        // show information view
        self.regulationsView.isHidden = false
        
        // update the information view elements color
        self.mapAnnotationImageView.tintColor = self.viewModel.signal.color
        self.regulationsView.backgroundColor = self.viewModel.signal.color
        self.tableView.backgroundColor = self.viewModel.signal.color
        
    }
}
