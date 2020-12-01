//
//  TitleHeaderFooterViewRepresentable.swift
//  COVID WARN
//
//  Created by mihmouda on 11/28/20.
//

import UIKit

class TitleHeaderFooterViewRepresentable: TableHeaderFooterViewRepresentable {
    
    /// View Height
    var viewHeight: CGFloat
    
    /// Reuse Identifier
    var reuseIdentifier: String
    
    /// Background Color
    var backgroundColor: UIColor

    /// Title
    private(set) var title: String
    
    /**
     Initializer
     */
    init() {
        
        // Set default values
        self.title = ""
        self.viewHeight = 0.0
        self.reuseIdentifier = ""
        self.backgroundColor = .clear
    }
    
    /**
     Initializer
    - Parameter title: Title String.
    - Parameter backgroundColor: Background Color.
     */
    convenience init(title: String, backgroundColor: UIColor) {
        self.init()
        
        // set values
        self.title = title
        self.backgroundColor = backgroundColor
        
    }
}
