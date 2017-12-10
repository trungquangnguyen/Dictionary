//
//  String.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

extension String {
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
