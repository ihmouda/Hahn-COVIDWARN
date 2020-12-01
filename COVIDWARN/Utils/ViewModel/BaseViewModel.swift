//
//  BaseViewModel.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import UIKit

/// Base View Model Protocol
protocol BaseViewModel {
    
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int

    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView ) -> CGFloat

    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable?
    
    /**
     Handle no internet connection
     - Returns: Bool to indicate if handled by adding general resource.
     */
    func handleNoInternetConnection() -> Bool
}


/// Base View Model Extension with Default implementation
extension BaseViewModel {
    
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int {
        return 1
    }
}
