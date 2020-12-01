//
//  RegulationTableViewCellRepresentable.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import UIKit

/// Regulation Table View Cell Representable
class RegulationTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// text
    var text: String
    
    /// Image
    var image: UIImage?

    /// Cell Height
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String = "RegulationTableViewCell"
   
    /**
     Initializer
    - Parameter regulation: COVIDRegulation
     */
    init(regulation: COVIDRegulation) {
        
        // Set values
        self.text = regulation.title
        self.image = UIImage(named: regulation.imageName)
        
    }
}
