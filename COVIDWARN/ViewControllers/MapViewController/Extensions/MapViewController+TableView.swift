//
//  MapViewController+TableView.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/28/20.
//

import UIKit

// MARK: - UITableViewDelegate
extension MapViewController: UITableViewDataSource, UITableViewDelegate {
    
    /**
     Number of sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }

    /**
     Number of rows in section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }

    /**
     Cell for row at
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get cell Representable
        let cellRepresentable = self.viewModel.representableForRow(at: indexPath)
        
        // RegulationTableViewCellRepresentable
        if let represnetable = cellRepresentable as? RegulationTableViewCellRepresentable {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: represnetable.cellReuseIdentifier) as! RegulationTableViewCell
            cell.setup(with: represnetable)
            return cell
            
        }
        
        return UITableViewCell()
    }

    /**
     Height For Row At indexPath
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.heightForRow(at: indexPath, tableView: tableView)
    }
    
    /**
     Height For Header In Section
     */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.viewModel.heightForHeader(inSection: section, tableView: tableView)
    }
    
    /**
     Height For Footer In Section
     */
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    /**
     View For Header In Section
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Header representable
        if let headerRepresentable = self.viewModel.representableForHeader(inSection: section) as? TitleHeaderFooterViewRepresentable {
            
            // Get section header view
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleHeaderFooterView.getReuseIdentifier()) as! TitleHeaderFooterView
            headerView.setup(with: headerRepresentable)
            headerView.tintColor = self.viewModel.signal.color
            return headerView
        }
        
        return nil
    }
}
