//
//  FeatureDataViewModel.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/29/20.
//

import UIKit

class FeatureDataViewModel {
    
    /// Data
    private(set) var data: FeatureItemAttribute
    
    /// Representables
    private(set) var representables: [TableViewCellRepresentable]
 
    /**
     Initializer
     - Parameter data: Feature Item Attribute.
     */
    init(data: FeatureItemAttribute) {
        
        // set data
        self.data = data
        self.representables = []
        self.buildRepresentables()

    }

    /**
     Build Representables
     */
    private func buildRepresentables() {
             
        // total cases
        let totalCasesRepresentable = FeatureDataTableViewCellRepresentable(value:  Double(self.data.casesNo), type: FeatureDataType.totalCases)
        self.representables.append(totalCasesRepresentable)
        
        // death cases
        let deathCasesRepresentable = FeatureDataTableViewCellRepresentable(value: Double(self.data.deathsNo), type: FeatureDataType.deathCases)
        self.representables.append(deathCasesRepresentable)
        
        // death rate
        let deathRateRepresentable = FeatureDataTableViewCellRepresentable(value: ceil(self.data.deathRate*100)/100, type: FeatureDataType.deathRate)
        self.representables.append(deathRateRepresentable)
        
    }
}

/// BaseViewModel
extension FeatureDataViewModel: BaseViewModel {
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    /**
     Handle no internet connection
     - Returns: Bool to indicate if handled by adding general resource.
     */
    func handleNoInternetConnection() -> Bool {
        return false
    }
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView ) -> CGFloat {
        
        let representable = self.representableForRow(at: indexPath)
        return representable?.cellHeight ?? 0.0
    }

    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        
        if self.representables.count > indexPath.row {
            return self.representables[indexPath.row]
        }
        
        return nil
    }
}
