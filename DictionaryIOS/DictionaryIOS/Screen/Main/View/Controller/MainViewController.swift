//
//  ViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 6/1/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
import KYDrawerController
import XLPagerTabStrip

class MainViewController: BaseButtonBarPagerTabStripViewController<TabButtonBarCell> {
    @IBOutlet weak var shadowView: UIView!
    
    fileprivate var drawer: KYDrawerController?
    
    override func viewDidLoad() {
        changeSelectedBarColor()
        super.viewDidLoad()
        setUpUI()
        shadowButtonBar()
    }
    
    @IBAction func leftMenuAction(_ sender: Any) {
        drawer?.setDrawerState(.opened, animated: true)
    }
    
    //MARK: XLPagerTabTrip
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: XibIdentify.Main.TabButtonBarCell, bundle: Bundle(for: TabButtonBarCell.self), width: { (cell: IndicatorInfo) -> CGFloat in
            return Screen.WIDTH / 4
        })
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let permistionVC = MorePermissionViewController()
        return [permistionVC, permistionVC, permistionVC, permistionVC]
    }
    
    override func configure(cell: TabButtonBarCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysTemplate)
    }
    
    private func shadowButtonBar(){
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowRadius = 2.0
    }
    
    private func changeSelectedBarColor(){
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = AppColors.mainColor
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = {  (oldCell: TabButtonBarCell?, newCell: TabButtonBarCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.iconImage.tintColor = AppColors.grayColor
            newCell?.iconImage.tintColor = AppColors.mainColor
            
        }
    }
    /*__________________//---XLPagerTabTrip---\\__________________________*/
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
