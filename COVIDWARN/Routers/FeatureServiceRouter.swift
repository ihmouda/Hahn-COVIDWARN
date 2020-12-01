//
//  FeatureServiceRouter.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import Alamofire
import Foundation

/// Feature Service Router
enum FeatureServiceRouter: URLRequestConvertible {
    
    // Query
    case query(paramters: Parameters)
        
    /// Method
    var method: HTTPMethod {
        switch self {
        case .query:
            return .get
        }
    }
    
    /// Path
    var path: String {
        switch self {
        case .query(_):
            return "mOBPykOjAyBO2ZKk/arcgis/rest/services/RKI_Landkreisdaten/FeatureServer/0/query"
        }
    }
    
    /// Base Url String
    var baseUrlString: String {
        return "https://services7.arcgis.com"
    }
    
    /**
     As URL Request.
     - Returns: URL Request.
     */
    func asURLRequest() throws -> URLRequest {
        
        // Get base url
        let url = try self.baseUrlString.asURL()
        
        // Create url requst
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method.rawValue

        switch self {
        case .query(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            break
        }
        
        return urlRequest
    }
}
