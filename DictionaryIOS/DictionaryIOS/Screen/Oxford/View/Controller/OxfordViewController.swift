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
    
    var word: OxFordWord!{
        didSet{
            guard isViewLoaded else {
                return
            }
            setDataTopView()
        }
    }
    
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
        labelWordClass.setSize24_italic()
        registerCell()
        setDataTopView()
    }
    
    private func setDataTopView(){
        guard word != nil else {
            return
        }
        labelKeyWord.text = word.keyWord
        labelWordClass.text = "/\(getWordClass())/"
        collectionPronuciation.reloadData()
    }
    
    private func getWordClass() -> String {
        return word.wordClasses.joined(separator: ", ")
    }
    /**************************************************************************/
}

/**************************************************************************/
// MARK: -  Top View Collection Pronuciation
/**************************************************************************/
extension OxfordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return word?.pronunciations.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XibIdentify.Oxford.OxFordTopCollectionViewCell, for: indexPath) as! OxFordTopCollectionViewCell
        cell.prounication = word.pronunciations[indexPath.row]
        cell.delegate = self
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


/**************************************************************************/
// MARK: - OxFordTopCollectionViewCellDelegate
/**************************************************************************/
extension OxfordViewController: OxFordTopCollectionViewCellDelegate {
    func didSelectSpeakerButton(urlString: String) {
        
    }
}
/*************************---OxFordTopCollectionViewCellDelegate---*****************************/
