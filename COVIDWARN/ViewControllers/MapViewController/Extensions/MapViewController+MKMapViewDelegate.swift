//
//  MapViewController+MapView.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/28/20.
//

import Foundation
import MapKit

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    /**
     RegionDidChange
     - Parameter mapView: MKMapView.
     - Parameter animated: Is Animated.
     */
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        // query for data at location
        self.queryForFeatureServiceDataAtLocation(mapView.centerCoordinate)
    }
}
