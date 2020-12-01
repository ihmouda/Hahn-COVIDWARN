//
//  ModelResult.swift
//  COVID WARN
//
//  Created by mihmouda on 11/27/20.
//

/// Model completion block
typealias ModelCompletion<T> = (ModelResult<T>) -> Void

/// Model Result
enum ModelResult<T> {
    case success(T)
    case failure(_ error: Error)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}
