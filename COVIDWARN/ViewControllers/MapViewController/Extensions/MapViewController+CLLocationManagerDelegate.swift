//
//  MapViewController+CLLocationManagerDelegate.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/28/20.
//

import UIKit
import CoreLocation
import MapKit

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    
    /**
     Did Update Locations
     - Parameter manager: CLLocationManager.
     - Parameter locations: locations array.
     */
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // guard check location
        guard let location = locations.first else { return }
        
        // set user location
        self.userLocation = location
    }
    
    /**
     Did Failed in Update Locations
     - Parameter manager: CLLocationManager.
     - Parameter error: Error.
     */
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
