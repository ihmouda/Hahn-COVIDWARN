//
//  TableSectionRepresentable.swift
//  COVID WARN
//
//  Created by mihmouda on 11/30/20.
//

import Foundation

/// Table View Cell Representable
class TableSectionRepresentable {
    
    /// Header Representable
    var sectionHeaderRepresentable: TableHeaderFooterViewRepresentable?
    
    /// Cells Representables
    var cellsRepresentables: [TableViewCellRepresentable]
    
    /**
     Initialization
     */
    init() {
        
        self.sectionHeaderRepresentable = nil
        self.cellsRepresentables = []
    }
}
