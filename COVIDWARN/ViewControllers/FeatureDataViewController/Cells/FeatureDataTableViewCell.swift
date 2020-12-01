//
//  FeatureDataTableViewCell.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/29/20.
//

import UIKit

/// Feature Data Table View Cell
class FeatureDataTableViewCell: UITableViewCell {
    
    /// Title
    @IBOutlet weak private var title: UILabel!
    
    /// Value
    @IBOutlet weak private var value: UILabel!
    
    /// Data Image View
    @IBOutlet weak private var dataImageView: UIImageView!
    
    /// Container View
    @IBOutlet weak private var containerView: UIView!
    
    /**
     Awake from nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.containerView.layer.cornerRadius = 30
        self.containerView.layer.borderColor = UIColor(red: 22.0/255, green: 172.0/255, blue: 199.0/255, alpha: 1.0).cgColor
        self.containerView.layer.borderWidth = 2.0
        self.containerView.clipsToBounds = true
    }
    
    /**
     Setup
     - Parameter representable: FeatureDataTableViewCellRepresentable.
     */
    func setup(with representable: FeatureDataTableViewCellRepresentable) {
        
        // Set data
        self.title.text = representable.title
        self.value.text = representable.value.description
        self.dataImageView.image = representable.image
      
    }
}
