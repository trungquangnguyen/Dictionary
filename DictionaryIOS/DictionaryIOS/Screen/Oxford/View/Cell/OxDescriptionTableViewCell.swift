//
//  OxDescriptionTableViewCell.swift
//  DictionaryIOS
//
//  Created by trung quang on 1/10/18.
//  Copyright © 2018 SSD. All rights reserved.
//

import UIKit

class OxDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelLeading: NSLayoutConstraint!
    @IBOutlet weak var lineShortcut: UIView!
    @IBOutlet weak var lineShortcutLeading: NSLayoutConstraint!
    
    var model: DescriptionViewModel!{
        didSet{
            switch model.type {
            case .ShortCut:
                label.text = "** \(model.text)"
                labelLeading.constant = 10
                label.font = AppFonts.nameFontCell
                label.textColor = AppColors.mainColor
                lineShortcutLeading.constant = 25
                lineShortcut.isHidden = false
                lineShortcut.backgroundColor = AppColors.mainColor
                return
            case .Description:
                label.text = "* \(model.text)"
                labelLeading.constant = 20
                label.font = AppFonts.nameFontCell
                label.textColor = .black
                lineShortcut.isHidden = false
                lineShortcutLeading.constant = 20
                lineShortcut.backgroundColor = .gray
                return
            case .Example:
                label.text = "-\(model.text)"
                labelLeading.constant = 20
                label.font = AppFonts.descriptionFont
                label.textColor = .black
                lineShortcut.isHidden = true
                return
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
