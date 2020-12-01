//
//  TitleHeaderFooterView.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import UIKit

/// Title Header Footer View
class TitleHeaderFooterView: UITableViewHeaderFooterView {
    
    /// Title Label
    @IBOutlet private weak var titleLabel: UILabel!
    
    /**
     Setup
     - Parameter represenable: The Title Header Footer View Representable object
     */
    func setup(with representable: TitleHeaderFooterViewRepresentable) {
                
        // Set title label
        self.titleLabel.text = representable.title
        
        // Set background color
        self.backgroundColor = representable.backgroundColor
 
    }
    
    // MARK: - Class methods
    
    /**
     Get view reuse identifier
     - Returns : View reuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "TitleHeaderFooterView"
    }
    
    /**
     Register header view class in the table
     - Parameter tableView : The table view to register the header view in it
     */
    class func registerHeaderView(in tableView: UITableView) {
        tableView.register(UINib(nibName: "TitleHeaderFooterView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: TitleHeaderFooterView.getReuseIdentifier())
    }
    
    /**
     Get View height
     */
    class func getViewHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
}
