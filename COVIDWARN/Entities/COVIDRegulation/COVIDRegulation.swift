//
//  COVIDRegulation.swift
//  COVID WARN
//
//  Created by mihmouda on 11/27/20.
//

import Foundation

/// COVID Regulation
enum COVIDRegulation {
    
    // General Regulation
    case generalRegulation(COVIDRegulation.GeneralRegulation)
    
    // Signal Regulation
    case signalRegulation(COVIDRegulation.SignalRegulation)
    
    // General Regulations
    static let allGeneralRegulations: [COVIDRegulation] =
        [.generalRegulation(.washHands),
         .generalRegulation(.safeDistance),
         .generalRegulation(.airRoom),
         .generalRegulation(.wearMask)]
    
    // Title
    var title: String {
        
        switch self {
        
        case .generalRegulation(let generalType):
            return generalType.title
            
        case .signalRegulation(let signalType):
            return signalType.title
        }
    }
    
    // Image Name
    var imageName: String {
        
        switch self {
        case .generalRegulation(let generalType):
            return generalType.imageName
            
        case .signalRegulation(let type):
            return type.imageName
        }
    }
    
    // Header Title
    var headerTitle: String {
        
        switch self {
        case .generalRegulation(_):
            return NSLocalizedString("general_regulations_header_title", comment: "")
        case .signalRegulation(let type):
            return String(format: NSLocalizedString("signal_regulations_header_title", comment: ""), type.signalTitle)
        }
    }
    
    /// Signal Regulation
    enum SignalRegulation {
        
        case mask(COVIDSignal)
        case faceToFace(COVIDSignal)
        case events(COVIDSignal)
        case curfew(COVIDSignal)
        
        // Title
        var title: String {
            
            var localizedKey = ""
            
            switch self {
            case .mask(let signal):
                switch signal {
                case .green:
                    localizedKey = "greenSignal_mask_rules"
                case .yello:
                    localizedKey = "yellowSignal_mask_rules"
                case .red(let redType):
                    switch redType {
                    case .regular:
                        localizedKey = "redSignal_mask_rules"
                    case .dark:
                        break
                    }
                default:
                    break
                }
            case .faceToFace(let signal):
                switch signal {
                case .green:
                    localizedKey =  "greenSignal_faceToFace_rules"
                default:
                    break
                }
            case .events(let signal):
                switch signal {
                case .green:
                    localizedKey = "greenSignal_events_rules"
                case .yello:
                    localizedKey = "yellowSignal_events_rules"
                case .red(let redType):
                    switch redType {
                    case .regular:
                        localizedKey = "redSignal_events_rules"
                    case .dark:
                        localizedKey = "darkRedSignal_events_rules"
                    }
                default:
                    break
                }
            case .curfew(let signal):
                switch signal {
                case .yello:
                    localizedKey = "yellowSignal_curfew_rules"
                case .red(let redType):
                    switch redType {
                    case .regular:
                        localizedKey = "redSignal_curfew_rules"
                    case .dark:
                        localizedKey = "darkRedSignal_curfew_rules"
                    }
                default:
                    break
                }
            }
            
            return NSLocalizedString(localizedKey, comment: "")
        }
        
        // Image Name
        var imageName: String {
            
            switch self {
            case .mask(_):
                return "face-mask"
            case .faceToFace(_):
                return "social-distancing"
            case .events(_):
                return "events-icon"
            case .curfew(_):
                return "wall-clock"
            }
        }
        
        // Title
        var signalTitle: String {
            switch self {
            case .curfew(let signal), .events(let signal), .faceToFace(let signal), .mask(let signal):
                return signal.title
            }
        }
    }
    
    /// General Regulation
    enum GeneralRegulation {
        
        case washHands
        case safeDistance
        case airRoom
        case wearMask
        
        // Title
        var title: String {
            
            switch self {
            case .washHands:
                return NSLocalizedString("generalRegulation_washHands_title", comment: "")
            case .safeDistance:
                return NSLocalizedString("generalRegulation_safeDistance_title", comment: "")
            case .airRoom:
                return NSLocalizedString("generalRegulation_airRoom_title", comment: "")
            case .wearMask:
                return NSLocalizedString("generalRegulation_wearMask_title", comment: "")
            }
        }
        
        // Image Name
        var imageName: String {
            
            switch self {
            case .washHands:
                return "wash-yourhands"
            case .safeDistance:
                return "social-distancing"
            case .airRoom:
                return "air-room"
            case .wearMask:
                return "face-mask"
            }
        }
        
    }
}
