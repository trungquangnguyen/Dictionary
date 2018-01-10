//
//  OxFordVerbFormsViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 12/29/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class VerbFormDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    typealias TableViewConfigureCellBlock = (_ cell:UITableViewCell, _ indexPath: IndexPath) -> Void
    typealias TableViewSelectCellBlock = ((_ indexPath: IndexPath) -> Void)?
    
    var models:[VerbFormsViewModel]?
    var cellIdentifier: String
    var configureCellBlock: TableViewConfigureCellBlock
    var selectCellBlock: TableViewSelectCellBlock?
    
    init(tableView: UITableView, models:[VerbFormsViewModel]?, cellIdentifier: String, configureCellBlock: @escaping TableViewConfigureCellBlock, selectCellBlock: TableViewSelectCellBlock? = nil) {
        self.models =  models
        self.cellIdentifier = cellIdentifier
        self.configureCellBlock = configureCellBlock
        self.selectCellBlock = selectCellBlock
        tableView.registerCellByNibs(strings: [cellIdentifier])
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 35
    }
    
    /**************************************************************************/
    // MARK: - TableViewDatasource
    /**************************************************************************/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
        if models?.count ?? 0 > 0 {
            configureCellBlock(cell, indexPath)
        }
        return cell
    }
    /*************************---TableViewDatasource---*************************/
    
    /**************************************************************************/
    // MARK: - TableViewDelegate
    /**************************************************************************/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectCellBlock != nil {
            self.selectCellBlock!!(indexPath)
        }
    }
    /*************************---TableViewDelegate---**************************/
}

