//
//  Config.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/9/17.
//  Copyright © 2017 SSD. All rights reserved.
//
import UIKit

//AppIcons
struct AppIcons {
    static let leftMenuIcon = UIImage(named: "iconLeftMenu")
    static let searchIcon   = UIImage(named: "search-magnifier-interface-symbol")
    static let speakerIcon  = UIImage(named: "speaker")
}

//AppColor
struct AppColors {
    static let mainColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    static let redColor = UIColor(hexString: "BD5165")
    static let whiteColor   = UIColor.white
    static let grayColor    = UIColor.gray
}

// AppFonts
struct AppFonts {
    static let keyWordFont             = UIFont(name: "HelveticaNeue-BoldItalic", size: 40) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let wordClassFont             = UIFont(name: "HelveticaNeue-Italic", size: 24) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let userNameFont             = UIFont(name: "HelveticaNeue-Medium", size: 18) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let postionNameFont          = UIFont(name: "HelveticaNeue", size: 14) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let titleNavigationFont      = UIFont(name: "HelveticaNeue-Medium", size: 18) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let wellComeFont             = UIFont(name: "HelveticaNeue-Medium", size: 20) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let titleFont                = UIFont(name: "HelveticaNeue-Medium", size: 16) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let nameFontCell             = UIFont(name: "HelveticaNeue-Medium", size: 14) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let descriptionFont          = UIFont(name: "HelveticaNeue", size: 14) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let descriptionLargeFont          = UIFont(name: "HelveticaNeue-Italic", size: 16) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let diffrentFont             = UIFont(name: "HelveticaNeue", size: 12) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let diffrentMinFont             = UIFont(name: "HelveticaNeue", size: 11) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    static let commentFont              = UIFont(name: "HelveticaNeue", size: 14) ?? UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
}

