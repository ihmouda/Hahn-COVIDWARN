//
//  MapViewModel.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/28/20.
//

import UIKit

/// MapViewModel
class MapViewModel {
    
    /// Signal
    private(set) var signal: COVIDSignal

    /// General Regulations
    private(set) var generalRegulations: [COVIDRegulation]

    /// Representables
    private(set) var representables: [TableSectionRepresentable]
 
    /**
     Initializer
     - Parameter regulations: List of General COVID Regulations.
     */
    init(regulations: [COVIDRegulation]) {
        
        // Init data
        self.signal = .none
        self.representables = []
        self.generalRegulations = regulations
        self.buildGeneralRepresentables()

    }
    
    /**
     Set Signal
     - Parameter signal: COVID Signal.
     */
    func setSignal(_ signal: COVIDSignal) {
        
        // set data
        self.signal = signal        
        self.buildSignalRepresentables()
    }
    
    /**
     Build General Representables
     */
    private func buildGeneralRepresentables() {
                
        // section
        let section = TableSectionRepresentable()

        // set section header
        section.sectionHeaderRepresentable = TitleHeaderFooterViewRepresentable(title: self.generalRegulations.first?.headerTitle ?? "", backgroundColor: self.signal.color)
        section.sectionHeaderRepresentable?.viewHeight = 50.0
        
        // set section cell representables
        for regulation in self.generalRegulations {
            
            let representable = RegulationTableViewCellRepresentable(regulation: regulation)
            section.cellsRepresentables.append(representable)
            
        }
        
        // add section
        self.representables.append(section)
    }
        
    /**
     Build Signal Representables
     */
    private func buildSignalRepresentables() {
        
        // remove signal section representable
        if self.representables.count > 1 {
            self.representables.removeLast()
        }
        
        // section
        let section = TableSectionRepresentable()
        
        // set section header
        section.sectionHeaderRepresentable = TitleHeaderFooterViewRepresentable(title: self.signal.regulations.first?.headerTitle ?? self.signal.title, backgroundColor: self.signal.color)
        section.sectionHeaderRepresentable?.viewHeight = 50.0
        
        // set section cell representables
        for regulation in self.signal.regulations {
            
            let representable = RegulationTableViewCellRepresentable(regulation: regulation)
            section.cellsRepresentables.append(representable)
            
        }
        
        // add section
        self.representables.append(section)
    }
}

/// BaseViewModel
extension MapViewModel: BaseViewModel {
    
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int {
        return self.representables.count
    }

    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        
        if self.representables.count > section {
            return self.representables[section].cellsRepresentables.count
        }
        
        return 0
    }
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView ) -> CGFloat {
        
        if let cellRepresentable = self.representableForRow(at: indexPath) {
            return cellRepresentable.cellHeight
        }
        
        return 0.0
    }

    /**
     Handle no internet connection
     - Returns: Bool to indicate if handled by adding general resource.
     */
    func handleNoInternetConnection() -> Bool {
        return false
    }

    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        
        if self.representables.count > indexPath.section {
            let sectionRepresentable = self.representables[indexPath.section]
            
            if sectionRepresentable.cellsRepresentables.count > indexPath.row {
                return sectionRepresentable.cellsRepresentables[indexPath.row]
            }
        }
        return nil
    }
    
    /**
     Get header representable in section.
     - Parameter section: Index path section.
     - Returns: Table Header Footer View Representable.
     */
    func representableForHeader(inSection section: Int) -> TableHeaderFooterViewRepresentable? {
        
        if self.representables.count > section {
            return self.representables[section].sectionHeaderRepresentable
        }
        
        return nil
    }

    /**
     Height For Header
     - Parameter inSection: Index path section.
     - Parameter tableView: Table View.
     - Returns: height of header at section as CGFloat.
     */
    func heightForHeader(inSection section: Int, tableView: UITableView) -> CGFloat {
        return self.representableForHeader(inSection: section)?.viewHeight ?? CGFloat.leastNormalMagnitude
    }
}
