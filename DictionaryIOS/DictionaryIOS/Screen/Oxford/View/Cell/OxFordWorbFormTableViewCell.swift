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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
