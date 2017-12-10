//
//  MorePermissionViewController.swift
//  CCIOS
//
//  Created by NTQuang on 3/22/17.
//  Copyright © 2017 ConcungLtd. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MorePermissionViewController: UIViewController, IndicatorInfoProvider {
    
    let itemInfo        = IndicatorInfo(title: "", image: UIImage(named: "iconLeftMenu"))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    // MARK: - IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
}
