//
//  FeatureDataViewController+TableView.swift
//  Bavaria Regulations
//
//  Created by mihmouda on 11/29/20.
//


import UIKit

// MARK: - UITableViewDelegate
extension FeatureDataViewController: UITableViewDataSource, UITableViewDelegate {

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
        
        if let represnetable = cellRepresentable as? FeatureDataTableViewCellRepresentable {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: represnetable.cellReuseIdentifier) as! FeatureDataTableViewCell
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
 
}
