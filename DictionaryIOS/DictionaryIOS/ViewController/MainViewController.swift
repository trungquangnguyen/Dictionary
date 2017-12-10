//
//  ViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 6/1/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
import KYDrawerController

class MainViewController: UIViewController {
    let key = "car"

    fileprivate var drawer: KYDrawerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    @IBAction func leftMenuAction(_ sender: Any) {
        drawer?.setDrawerState(.opened, animated: true)
    }
}

extension MainViewController {
    fileprivate func setUpUI(){
        setUpLeftMenu()
    }
    
    private func setUpLeftMenu(){
        if let drawer = self.navigationController?.parent as? KYDrawerController {
            self.drawer = drawer
            self.drawer?.drawerWidth = Screen.WIDTH*2/3
        }
    }
}
