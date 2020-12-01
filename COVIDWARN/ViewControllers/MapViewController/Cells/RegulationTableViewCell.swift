//
//  RegulationTableViewCell.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import UIKit

/// Regulation Table View Cell
class RegulationTableViewCell: UITableViewCell {
    
    /// Rule Text
    @IBOutlet weak var ruleText: UILabel!
    
    /// Rule Image View
    @IBOutlet weak var ruleImageView: UIImageView!
    
    /**
     Setup
     - Parameter representable: RegulationTableViewCellRepresentable.
     */
    func setup(with representable: RegulationTableViewCellRepresentable) {
        
        // Set data
        self.ruleText.text = representable.text
        self.ruleImageView.image = representable.image
      
    }
}
