//
//  OxfordViewController.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/12/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class OxfordViewController: UIViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    /**************************************************************************/
    // MARK: - IndicatorInfoProvider
    /**************************************************************************/
    let itemInfo        = IndicatorInfo(title: "", image: UIImage(named: "iconLeftMenu"))
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    /**************************************************************************/
}
