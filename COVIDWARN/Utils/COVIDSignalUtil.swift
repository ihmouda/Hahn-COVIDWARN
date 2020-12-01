//
//  COVIDSignalUtil.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import Foundation

/// COVID Signal Util
class COVIDSignalUtil {
    
    /**
     Get COVID Signal For
     - Parameter data: Feature Item Attribute
     - Returns: COVID Signal
     */
    class func getCOVIDSignalFor(data: FeatureItemAttribute?) -> COVIDSignal {
        
        // guard get data
        guard let data = data else { return COVIDSignal.none }
        
        switch data.cases7Per100K {
        
        case let x where x < 35.0:
            return .green
        case let x where x >= 35.0 && x <= 50.0:
            return .yello
        case let x where (x > 50.0 && data.state == .other) || (x > 50.0 && x <= 100.0 && data.state == .bayern):
            return .red(COVIDSignal.RedSignal.regular)
        case let x where x > 100.0:
            return .red(COVIDSignal.RedSignal.dark)
        default:
            return .none
        }
    }
}

