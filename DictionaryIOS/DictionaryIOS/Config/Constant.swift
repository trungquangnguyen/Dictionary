//
//  Constant.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

struct Screen {
    static let BOUNDS   = UIScreen.main.bounds
    static let WIDTH    = UIScreen.main.bounds.size.width
    static let HEIGHT   = UIScreen.main.bounds.size.height
    static let MAX      = max(Screen.WIDTH, Screen.HEIGHT)
    static let MIN      = min(Screen.WIDTH, Screen.HEIGHT)
}
