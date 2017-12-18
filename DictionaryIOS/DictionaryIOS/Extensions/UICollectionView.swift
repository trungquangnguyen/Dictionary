//
//  UICollectionView.swift
//  DictionaryIOS
//
//  Created by SSD on 12/18/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCells(identifies: [String]){
        for id in identifies {
            let nib = UINib(nibName: id, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: id)
        }
    }
}

