//
//  FeatureItemAttribute.swift
//  COVID WARN
//
//  Created by mihmouda on 11/29/20.
//

/// Federal State
enum FederalState: String, Codable {
    
    case bayern   = "Bayern"
    case other
}

/// Feature Item Attribute
struct FeatureItemAttribute: Codable {
    
    /// Cases No
    var casesNo: Int
    
    /// Deaths No
    var deathsNo: Int
    
    /// Death Rate
    var deathRate: Double

    /// 7 days cases per 100K
    var cases7Per100K: Double
    
    /// State
    var state: FederalState = .other
    
    /// Cooding Keys
    private enum CodingKeys : String, CodingKey {
        
        case state                = "BL"
        case deathsNo             = "deaths"
        case deathRate            = "death_rate"
        case casesNo              = "cases"
        case cases7Per100K        = "cases7_per_100k"

    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let label = try container.decodeIfPresent(String.self, forKey: .state) {
            state = FederalState(rawValue: label) ?? .other
        }
        
        self.casesNo = try container.decodeIfPresent(Int.self, forKey: .casesNo) ?? 0
        self.deathsNo = try container.decodeIfPresent(Int.self, forKey: .deathsNo) ?? 0
        self.deathRate = try container.decodeIfPresent(Double.self, forKey: .deathRate) ?? 0.0
        self.cases7Per100K = try container.decodeIfPresent(Double.self, forKey: .cases7Per100K) ?? 0.0

    }
}
