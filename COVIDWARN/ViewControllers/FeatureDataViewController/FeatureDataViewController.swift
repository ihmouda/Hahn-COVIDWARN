//
//  FeatureDataViewController.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/29/20.
//

import UIKit
import MapKit
import CoreLocation

class FeatureDataViewController: UIViewController {
 
    /// Table view
    @IBOutlet private(set) weak var tableView: UITableView!

    /// Container view
    @IBOutlet private(set) weak var containerView: UIView!

    /// Title label
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    /// Feature Data
    var featureData: FeatureItemAttribute!
    
    /// View Model
    private(set) var viewModel: FeatureDataViewModel!
    
    /**
     View Did Load
     */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init view model.
        self.viewModel = FeatureDataViewModel(data: featureData)
        
        // Setup table view
        self.setupTableView()
        
        // Setup views
        self.setupViews()
    }
    
    /**
     Setup  Views
     */
    private func setupViews() {
        
        // Set background color
        self.view.backgroundColor = UIColor(red: 22.0/255, green: 172.0/255, blue: 199.0/255, alpha: 1.0)
        
        // Set title label text
        self.titleLabel.text = NSLocalizedString("statisticalInfoViewController_title", comment: "")
        
        // Add rounded
        let path = UIBezierPath(roundedRect: self.containerView.bounds,
                                byRoundingCorners: [UIRectCorner.topRight, UIRectCorner.topLeft],
                                cornerRadii: CGSize(width: 15, height:  15))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.containerView.layer.mask = maskLayer
    }
    
    /**
     Setup Table View
     */
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
}
