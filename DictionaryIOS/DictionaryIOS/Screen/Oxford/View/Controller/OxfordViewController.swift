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
    
    var viewModel: WordViewModel!{
        didSet{
            guard isViewLoaded else {
                return
            }
            setDataTopView()
            verbFormViewModels = viewModel.verbForms
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTopViewUI()
        configWordFormsViewUI()
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
    @IBOutlet weak var imageThumnail: UIImageView!
    let collectionCellPronunicationHeight: CGFloat = 50
    
    
    @IBAction func showFullImageAction(_ sender: Any) {
        
    }
    
    private func configTopViewUI(){
        labelKeyWord.setKeyWordFont()
        labelWordClass.setSize24_italic_gray()
        registerCell()
        setDataTopView()
    }
    
    private func setDataTopView(){
        guard viewModel != nil else {
            return
        }
        labelKeyWord.text = viewModel.keyWord
        labelWordClass.text = viewModel.wordClasses
        imageThumnail.setImageWithURLString(string: viewModel.thumUrl, supperView: topView)
        collectionPronuciation.reloadData()
    }
    /**************************************************************************/
    
    
    /**************************************************************************/
    // MARK: - Verb Forms
    /**************************************************************************/
    let verbFormContrainsHeightDefault: CGFloat = 40
    @IBOutlet weak var buttonWorbForms: UIButton!
    @IBOutlet weak var verbFormContrainsHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewWordForms: UITableView!
    
    fileprivate var verbFormViewModels = [VerbFormsViewModel](){
        didSet{
            guard isViewLoaded else {
                return
            }
            tableViewWordForms.reloadData()
            tableViewVerbFormHeight = tableViewWordForms.contentSize.height
        }
    }
    private var tableViewVerbFormHeight: CGFloat = 0
    private var isShowWordForms = false{
        didSet{
            isShowWordForms ? (verbFormContrainsHeight.constant = tableViewVerbFormHeight + verbFormContrainsHeightDefault) : (verbFormContrainsHeight.constant = verbFormContrainsHeightDefault)
        }
    }
    
    private func configWordFormsViewUI() {
        tableViewWordForms.registerCellByNibs(strings: [XibIdentify.Oxford.WorbFormTableViewCell])
        tableViewWordForms.tableFooterView = UIView()
        tableViewWordForms.rowHeight = UITableViewAutomaticDimension
        tableViewWordForms.estimatedRowHeight = 40
        verbFormViewModels = viewModel?.verbForms ?? [VerbFormsViewModel]()
    }
    
    @IBAction func wordFormsAction(_ sender: Any) {
        isShowWordForms = !isShowWordForms
        buttonWorbForms.isSelected = isShowWordForms
    }
    /*************************---Verb Forms---*****************************/
}

/**************************************************************************/
// MARK: -  Top View Collection Pronuciation
/**************************************************************************/
extension OxfordViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.pronunciations.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: XibIdentify.Oxford.TopCollectionViewCell, for: indexPath) as! OxFordTopCollectionViewCell
        cell.prounication = viewModel.pronunciations[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    fileprivate func registerCell(){
        collectionPronuciation.registerCells(identifies: [XibIdentify.Oxford.TopCollectionViewCell])
    }
}

extension OxfordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSize(string: viewModel.pronunciations[indexPath.row].spelling)
    }
    
    private func getSize(string: String) -> CGSize{
        let width = UILabel.width(font: AppFonts.descriptionFont, string: string) + 70
        return CGSize(width: width, height: collectionCellPronunicationHeight)
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

/**************************************************************************/
// MARK: - WorbForms TableView DataSource - Delegate
/**************************************************************************/
extension OxfordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verbFormViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: XibIdentify.Oxford.WorbFormTableViewCell, for: indexPath) as! OxFordWorbFormTableViewCell
        cell.verbForm = verbFormViewModels[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
/*************************---Private Method---*****************************/
