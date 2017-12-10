//
//  UIView.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

extension UIView {
    class func loadNib<T: UIView>(viewType: T.Type) -> T {
        let className = String.className(aClass: viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(viewType: self)
    }
}
