//
//  MapViewController+Network.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/28/20.
//

import UIKit
import Alamofire
import CoreLocation

/// Feature Service Request Tag
private enum FeatureServiceRequestTag: String {
    
    case format                                 = "f"
    case spatialRelationship                    = "spatialRel"
    case outFields                              = "outFields"
    case geometry                               = "geometry"
    case geometryType                           = "geometryType"
    case inputGeometrySpatialReference          = "inSR"
    case outputGeometrySpatialReference         = "outSR"
    case returnGeometry                         = "returnGeometry"
}

/// Feature Service Request Value
private enum FeatureServiceRequestValue: String {
    
    case json                                   = "json"
    case esriSpatialRelIntersects               = "esriSpatialRelIntersects"
    case all                                    = "*"
    case esriGeometryPoint                      = "esriGeometryPoint"
    case geometryType                           = "geometryType"
    case SRValue                                = "4326"
}

/// MapViewController+Network
extension MapViewController {
    
    /**
     Query For Feature Service Data At Location
     - Parameter location: CLLocationCoordinate2D.
     */
    func queryForFeatureServiceDataAtLocation(_ location: CLLocationCoordinate2D) {
        
        // build paramters
        var paramters = Parameters()
        paramters.updateValue(FeatureServiceRequestValue.json.rawValue, forKey: FeatureServiceRequestTag.format.rawValue)
        paramters.updateValue(FeatureServiceRequestValue.esriSpatialRelIntersects.rawValue, forKey: FeatureServiceRequestTag.spatialRelationship.rawValue)
        paramters.updateValue(FeatureServiceRequestValue.all.rawValue, forKey: FeatureServiceRequestTag.outFields.rawValue)
        paramters.updateValue(location.longitude.description + " , " + location.latitude.description, forKey: FeatureServiceRequestTag.geometry.rawValue)
        paramters.updateValue(FeatureServiceRequestValue.esriGeometryPoint.rawValue, forKey: FeatureServiceRequestTag.geometryType.rawValue)
        paramters.updateValue(FeatureServiceRequestValue.SRValue.rawValue, forKey: FeatureServiceRequestTag.inputGeometrySpatialReference.rawValue)
        paramters.updateValue(FeatureServiceRequestValue.SRValue.rawValue, forKey: FeatureServiceRequestTag.outputGeometrySpatialReference.rawValue)
        paramters.updateValue(false.description, forKey: FeatureServiceRequestTag.returnGeometry.rawValue)
        
        // start animating
        self.activityIndicator.startAnimating()
        
        // Get Data
        AF.request(FeatureServiceRouter.query(paramters: paramters)).responseDecodable(of: FeatureData.self) { response in
            switch (response.result) {
            
            // success
            case Result.success(let data):
                self.didGetQueryData(data)
                
            // failed
            case Result.failure(let error):
                self.failedToGetQueryData(error)
            }
        }
    }
    
    /**
     Did Get Query Data
     - Parameter data: Feature Data.
     */
    private func didGetQueryData(_ data: FeatureData) {
        
        // stop animating
        self.activityIndicator.stopAnimating()

        // get signal
        let signal = COVIDSignalUtil.getCOVIDSignalFor(data: data.features.first?.attributes)
        
        // set feature data
        self.featureData = data.features.first?.attributes
    
        // guard not same signal
        guard signal != self.viewModel.signal else { return }

        // set view model signal
        self.viewModel.setSignal(signal)
        
        // update information view
        self.updateInformationView()

        // reload table data
        self.tableView.reloadData()
        
    }
    
    /**
     Failed To Get Query Data
     - parameter Error: Error
     */
    private func failedToGetQueryData(_ error: Error) {
        
        // stop animating
        self.activityIndicator.stopAnimating()
        
    }
}
