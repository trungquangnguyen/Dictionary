//
//  String.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

extension String {
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    //MARK: - SubString
    func index(from: Int) -> Index {
        return index(startIndex, offsetBy: from)
    }
    func substring(to: Int) -> String {
        return substring(0, end: to)
    }
    func substring(_ start: Int, end: Int) -> String {
        return String(self[Range(self.index(self.startIndex, offsetBy: start) ..< self.index(self.startIndex, offsetBy: end))])
    }
    func substring(_ range: NSRange) -> String {
        var end = range.location + range.length
        end = end > self.count ? self.count - 1 : end
        return self.substring(range.location, end: end)
    }
    
    //MARK: - Find index of subString
    func index(of string: String, options: String.CompareOptions = .literal) -> String.Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func indexes(of string: String, options: String.CompareOptions = .literal) -> [String.Index] {
        var result: [String.Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: String.CompareOptions = .literal) -> [Range<String.Index>] {
        var result: [Range<String.Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
    
    //MARk: - Convert to NSMutableAttributedString
    /// Creates a new NSMutableAttributedString from String and substring with UIFont
    ///
    /// Notes: chilsFont.count > 0, while chilsFont.count = 1, use chilsFont[0] for all chils
    ///
    /// - Parameters:
    ///   - defaultFont::UIFont - Font for self.
    ///   - chilsFont::[UIFont] - list Font corresponding with chils.
    ///   - chils::[String] - listChils corresponding with chilsFont
    func mutableAttString(defaultFont: UIFont, chilsFont: [UIFont], chils: [String]) -> NSMutableAttributedString{
        if chilsFont.count != chils.count && chilsFont.count != 1 {
            fatalError("String.swift file, chilsFont.count do not equal chils.count")
        }
        if chilsFont.count == 0 {
            fatalError("String.swift file, chilsFont.count = 0")
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: self,
            attributes: [
                NSAttributedStringKey.paragraphStyle: paragraphStyle,
                NSAttributedStringKey.font : defaultFont
            ]
        )
        for (i, string) in chils.enumerated() {
            var font = chilsFont.get(at: 0)!
            if chilsFont.count > 1 {
                font = chilsFont.get(at: i)!
            }
            let attribute = [NSAttributedStringKey.font: font]
            let range: Range<String.Index>? = self.range(of: string)
            if range == nil {
                continue
            }
            let index: Int = self.distance(from: self.startIndex, to: range!.lowerBound)
            let nsrange = NSRange(location: index, length: string.count)
            messageText.addAttributes(attribute, range: nsrange)
        }
        return messageText
    }
}
