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
        configTopViewUI()
    }
    /**************************************************************************/
    // MARK: - IndicatorInfoProvider
    /**************************************************************************/
    let itemInfo        = IndicatorInfo(title: "", image: AppIcons.searchIcon)
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    /**************************************************************************/
    
    
    /**************************************************************************/
    // MARK: - TopView
    /**************************************************************************/
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var labelKeyWord: UILabel!
    @IBOutlet weak var labelWordClass: UILabel!
    @IBOutlet weak var collectionPronuciation: UICollectionView!
    
    private func configTopViewUI(){
        labelKeyWord.setKeyWordFont()
        labelWordClass.setSize12_black()
        registerCell()
    }
    /**************************************************************************/
}

/**************************************************************************/
// MARK: -  Top View Collection Pronuciation
/**************************************************************************/
extension OxfordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XibIdentify.Oxford.OxFordTopCollectionViewCell, for: indexPath)
        return cell
    }
    
    fileprivate func registerCell(){
        collectionPronuciation.registerCells(identifies: [XibIdentify.Oxford.OxFordTopCollectionViewCell])
    }
}

extension OxfordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0001
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0001
    }
}
/**************************************************************************/

