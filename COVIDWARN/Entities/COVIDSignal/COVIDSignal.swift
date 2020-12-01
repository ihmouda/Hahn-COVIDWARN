//
//  COVIDSignal.swift
//  COVID WARN
//
//  Created by mihmouda on 11/27/20.
//

import UIKit

/// COVID Signal
enum COVIDSignal: Equatable {
    
    case green
    case yello
    case red(COVIDSignal.RedSignal)
    case none
    
    /// Title
    var title: String {
        switch self {
        case .green:
            return NSLocalizedString("general.green", comment: "")
        case .yello:
            return NSLocalizedString("general.yellow", comment: "")
        case .red(let redType):
            return redType.title
        default:
            return ""
        }
    }
    
    /// Color
    var color: UIColor {
        switch self {
        case .green:
            return UIColor(red: 55.0/255, green: 183.0/255, blue: 16.0/255, alpha: 1.0)
        case .yello:
            return UIColor(red: 226.0/255, green: 217.0/255, blue: 0.0, alpha: 1.0)
        case .red(let redType):
            return redType.color
        default:
            return .white
        }
    }
    
    /// Red Signal
    enum RedSignal {
        
        case regular
        case dark
        
        /// Title
        var title: String {
            
            switch self {
            case .regular:
                return NSLocalizedString("general.red", comment: "")
            case .dark:
                return NSLocalizedString("general.darkRed", comment: "")
            }
        }
        
        /// Color
        var color: UIColor {
            
            switch self {
            case .regular:
                return UIColor(red: 255.0/255, green: 0.0, blue: 0.0, alpha: 1.0)
            case .dark:
                return UIColor(red: 90.0/255, green: 0.0, blue: 0.0, alpha: 1.0)
            }
        }
        
    }
    
    /// Regulations
    var regulations: [COVIDRegulation] {
        
        switch self {
        case .green:
            return [COVIDRegulation.signalRegulation(.faceToFace(self)),
                    COVIDRegulation.signalRegulation(.events(self)),
                    COVIDRegulation.signalRegulation(.mask(self))]
            
        case .yello:
            return [COVIDRegulation.signalRegulation(.events(self)),
                    COVIDRegulation.signalRegulation(.mask(self)),
                    COVIDRegulation.signalRegulation(.curfew(self))]
            
        case .red(let redType):
            
            switch redType {
            case .regular:
                return [COVIDRegulation.signalRegulation(.events(self)),
                        COVIDRegulation.signalRegulation(.mask(self)),
                        COVIDRegulation.signalRegulation(.curfew(self))]
            case .dark:
                return [COVIDRegulation.signalRegulation(.events(self)),
                        COVIDRegulation.signalRegulation(.curfew(self))]
            }
            
        default:
            return []
        }
    }
}
