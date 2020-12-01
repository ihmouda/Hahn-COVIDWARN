//
//  TableViewCellRepresentable.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import UIKit

/// Table View Cell Representable
protocol TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat { get set }
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String { get set }
}
