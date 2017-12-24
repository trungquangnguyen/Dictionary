//
//  UITableView.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/24/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
extension UITableView {
    func registerCellByNibs(strings: [String]){
        separatorStyle = .none
        for string in strings {
            let nib = UINib(nibName: string, bundle: nil)
            register(nib, forCellReuseIdentifier: string)
        }
    }
}

