//
//  TableHeaderFooterViewRepresentable.swift
//  COVID WARN
//
//  Created by mihmouda on 11/28/20.
//

import UIKit

/// Table Header Footer View Representable
protocol TableHeaderFooterViewRepresentable {
    
    /// View Height
    var viewHeight: CGFloat { get set }
    
    /// Reuse Identifier
    var reuseIdentifier: String { get set }
}
