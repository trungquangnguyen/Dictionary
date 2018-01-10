//
//  UILabel.swift
//  DictionaryIOS
//
//  Created by SSD on 12/18/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

extension UILabel {
    func setKeyWordFont(){
        self.font = AppFonts.keyWordFont
        self.textColor = .black
    }
    func setSize14_black(){
        self.font = AppFonts.descriptionFont
        self.textColor = .black
    }
    func setSize16_Italic(){
        self.font = AppFonts.descriptionLargeFont
        self.textColor = .black
    }
    func setSize12_black(){
        self.font = AppFonts.diffrentFont
        self.textColor = .black
    }
    func setSize12_gray(){
        self.font = AppFonts.diffrentFont
        self.textColor = .gray
    }
    func setSize24_italic_gray(){
        self.font = AppFonts.wordClassFont
        self.textColor = .gray
    }
    static func size(font:UIFont, string: String) -> CGSize {
        let label = UILabel(frame: CGRect(x: 0, y: 0, w: 1000, h: 1000))
        label.text = string
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.sizeToFit()
        return label.size
    }
    static func width(font:UIFont, string: String) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, w: 1000, h: 1000))
        label.text = string
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.sizeToFit()
        return label.size.width
    }
}
