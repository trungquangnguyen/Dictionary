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
            desViewModels = viewModel.des
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTopViewUI()
        configVerbFormsViewUI()
        configDesViewUI()
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
    let verbFormContrainsHeightDefault: CGFloat = 30
    @IBOutlet weak var buttonWorbForms: UIButton!
    @IBOutlet weak var verbFormContrainsHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewWordForms: UITableView!
    var verbFormDataSource: VerbFormDataSource?
    
    fileprivate var verbFormViewModels = [VerbFormsViewModel](){
        didSet{
            guard isViewLoaded else {
                return
            }
            isShowWordForms = false
            buttonWorbForms.isSelected = isShowWordForms
            if verbFormViewModels.count != 0 {
                tableViewVerbFormHeight = CGFloat(verbFormViewModels.count) * tableViewWordForms.rowHeight + verbFormContrainsHeightDefault
                verbFormContrainsHeight.constant = verbFormContrainsHeightDefault
            } else {
                tableViewVerbFormHeight = 0
                verbFormContrainsHeight.constant = 0
            }
        }
    }
    private var tableViewVerbFormHeight: CGFloat = 0
    private var isShowWordForms = false{
        didSet{
            isShowWordForms ? (verbFormContrainsHeight.constant = tableViewVerbFormHeight) : (verbFormContrainsHeight.constant = verbFormContrainsHeightDefault)
        }
    }
    private func configVerbFormsViewUI() {
        verbFormDataSource = VerbFormDataSource(tableView: tableViewWordForms, models: verbFormViewModels, cellIdentifier: XibIdentify.Oxford.WorbFormTableViewCell, configureCellBlock: { (cell, item) in
            if let theCell = cell as? OxFordWorbFormTableViewCell {
                theCell.verbForm = self.verbFormViewModels.get(at: item.row)
            }
        })
        tableViewWordForms.dataSource = verbFormDataSource
        verbFormViewModels = viewModel?.verbForms ?? [VerbFormsViewModel]()
    }
    private func verbFormReloadData(){
        verbFormDataSource?.models = verbFormViewModels
        tableViewWordForms.reloadData()
    }
    @IBAction func verbFormsAction(_ sender: Any) {
        isShowWordForms = !isShowWordForms
        buttonWorbForms.isSelected = isShowWordForms
        if isShowWordForms{
            verbFormReloadData()
        }
    }
    /*************************---Verb Forms---*****************************/
    
    /**************************************************************************/
    // MARK: - Description
    /**************************************************************************/
    let desContrainsHeightDefault: CGFloat = 30
    @IBOutlet weak var buttonDes: UIButton!
    @IBOutlet weak var desContrainsHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewDes: UITableView!
    var desDataSource: OxDesDataSourceDelegate?
    
    fileprivate var desViewModels = [DescriptionViewModel](){
        didSet{
            guard isViewLoaded else {
                return
            }
            isShowDes = false
            buttonDes.isSelected = isShowDes
            if verbFormViewModels.count != 0 {
                tableViewDesHeight = tableViewDes.contentSize.height + verbFormContrainsHeightDefault
                desContrainsHeight.constant = verbFormContrainsHeightDefault
            } else {
                tableViewDesHeight = 0
                desContrainsHeight.constant = 0
            }
        }
    }
    private var tableViewDesHeight: CGFloat = 0
    private var isShowDes = false{
        didSet{
            isShowDes ? (desContrainsHeight.constant = tableViewVerbFormHeight) : (desContrainsHeight.constant = verbFormContrainsHeightDefault)
        }
    }
    private func configDesViewUI() {
        desDataSource = OxDesDataSourceDelegate(tableView: tableViewDes, models: verbFormViewModels, cellIdentifier: XibIdentify.Oxford.WorbFormTableViewCell, configureCellBlock: { (cell, item) in
            if let theCell = cell as? OxFordWorbFormTableViewCell {
                theCell.verbForm = self.verbFormViewModels.get(at: item.row)
            }
        })
        tableViewDes.dataSource = desDataSource
        verbFormViewModels = viewModel?.verbForms ?? [VerbFormsViewModel]()
    }
    private func desReloadData(){
        desDataSource?.models = verbFormViewModels
        tableViewDes.reloadData()
    }
    @IBAction func desAction(_ sender: Any) {
        isShowDes = !isShowDes
        buttonDes.isSelected = isShowDes
        if isShowDes {
            desReloadData()
        }
    }
    /*************************---Descriptions---*****************************/
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

