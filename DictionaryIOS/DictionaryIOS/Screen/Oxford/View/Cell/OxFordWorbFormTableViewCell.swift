//
//  OxFordWorbFormTableViewCell.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/24/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class OxFordWorbFormTableViewCell: UITableViewCell {
    @IBOutlet weak var labelExample: UILabel!
    @IBOutlet weak var labelEnglishSpell: UILabel!
    @IBOutlet weak var labelAmericanSpell: UILabel!
    @IBOutlet weak var constraintWidthlabelEnSpell: NSLayoutConstraint!
    @IBOutlet weak var constraintWidthUsSpell: NSLayoutConstraint!
    
    var verbForm: VerbFormsViewModel!{
        didSet{
            labelExample.text = verbForm.example
            labelEnglishSpell.text = verbForm.englishSpelling
            labelAmericanSpell.text = verbForm.americanSpelling
            constraintWidthUsSpell.constant = UILabel.width(font: AppFonts.diffrentFont, string: verbForm.americanSpelling)
            constraintWidthlabelEnSpell.constant = UILabel.width(font: AppFonts.diffrentFont, string: verbForm.englishSpelling)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFont()
    }

    @IBAction func englishSpellAction(_ sender: Any) {
    }
    
    @IBAction func americanSpellAction(_ sender: Any) {
    }
}

extension OxFordWorbFormTableViewCell {
    fileprivate func setFont(){
        labelExample.setSize14_black()
        labelEnglishSpell.setSize12_gray()
        labelAmericanSpell.setSize12_gray()
    }
}
