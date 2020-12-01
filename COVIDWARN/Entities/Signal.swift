//
//  Signal.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/27/20.
//

import UIKit

enum COVIDSignal {
    
    case green
    case yello
    case red
    case darkRed
    case none
    
    var regulations: [Regulation] {
        switch self {
        case .green:
            return [Regulation.signalRegulation(self, .faceToFace),
                    Regulation.signalRegulation(self, .events),
                    Regulation.signalRegulation(self, .mask)]
            
        case .yello:
            return [Regulation.signalRegulation(self, .events),
                    Regulation.signalRegulation(self, .mask),
                    Regulation.signalRegulation(self, .curfew)]
            
        case .red:
            return [Regulation.signalRegulation(self, .events),
                    Regulation.signalRegulation(self, .mask),
                    Regulation.signalRegulation(self, .curfew)]
            
        case .darkRed:
            return [Regulation.signalRegulation(self, .events),
                    Regulation.signalRegulation(self, .curfew)]
            
        default:
            return []
        }
    }
    
    var title: String {
        switch self {
        case .green:
            return NSLocalizedString("general.green", comment: "")
        case .yello:
            return NSLocalizedString("general.yellow", comment: "")
        case .red:
            return NSLocalizedString("general.red", comment: "")
        case .darkRed:
            return NSLocalizedString("general.darkRed", comment: "")
        default:
            return ""
        }
    }
    
    
    var color: UIColor {
        switch self {
        case .green:
            return UIColor(red: 55.0/255, green: 183.0/255, blue: 16.0/255, alpha: 1.0)
        case .yello:
            return UIColor(red: 226.0/255, green: 217.0/255, blue: 0.0, alpha: 1.0)
        case .red:
            return UIColor(red: 255.0/255, green: 0.0, blue: 0.0, alpha: 1.0)
        case .darkRed:
            return UIColor(red: 90.0/255, green: 0.0, blue: 0.0, alpha: 1.0)
        default:
            return .clear
        }
    }
}
