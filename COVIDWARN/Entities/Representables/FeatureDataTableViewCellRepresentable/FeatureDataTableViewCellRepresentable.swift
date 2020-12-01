//
//  FeatureDataTableViewCellRepresentable.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/29/20.
//

import UIKit

/// Feature Data Type
enum FeatureDataType {
    
    case totalCases
    case deathCases
    case deathRate
    
    /// Title
    var title: String {
        
        switch self {
        case .totalCases:
            return NSLocalizedString("general.totalCases", comment: "")
        case .deathCases:
            return NSLocalizedString("general.deathCases", comment: "")
        case .deathRate:
            return NSLocalizedString("general.deathRate", comment: "")
        }
    }
    
    /// Image Name
    var imageName: String {
        
        switch self {
        case .totalCases:
            return "totalcases"
        case .deathCases:
            return "deathcases"
        case .deathRate:
            return "deathrate"
        }
    }
    
    /// Data Type
    var dataType: String {
        
        switch self {
        case .totalCases:
            return NSLocalizedString("general.cases", comment: "")
        case .deathCases:
            return NSLocalizedString("general.cases", comment: "")
        case .deathRate:
            return NSLocalizedString("general.percentage", comment: "")
        }
    }
}

/// Feature Data Table View Cell Representable
class FeatureDataTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// Title
    var title: String
    
    /// Value
    var value: String
    
    /// Image
    var image: UIImage?

    /// Cell Height
    var cellHeight: CGFloat = 126.0
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String = "FeatureDataTableViewCell"
   
    /**
     Initializer
    - Parameter value: Value double.
    - Parameter type: Feature Data Type.
     */
    init(value: Double, type: FeatureDataType) {
        
        // Set data
        self.title = type.title
        self.image = UIImage(named: type.imageName)
        self.value = value.description + " " + type.dataType
        
    }
}
