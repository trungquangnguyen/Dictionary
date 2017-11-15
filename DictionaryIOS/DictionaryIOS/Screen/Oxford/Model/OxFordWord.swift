//
//  OxFordWord.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/5/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class OxFordWord: NSObject {
    var keyWord             : String = ""
    var pronunciations      : [OxFordWordPronuncation]?
    var wordClasses         : String = ""
    var isLiked             : Bool = false
    var des                 : [OxFordWordDes] = [OxFordWordDes]()
    var idioms              : [String] = [String]()
    var phrsalVerbs        : [OxFordWordPhrasal] = [OxFordWordPhrasal]()
    var nearbyWords         : [OxFordWordNearBy]  = [OxFordWordNearBy]()
    
    override init() {
        super.init()
    }
    
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
    
    func print(){
        let mirrored_object = Mirror(reflecting: self)
        for (index, attr) in mirrored_object.children.enumerated() {
            if let property_name = attr.label as String! {
                Swift.print("Attr \(index): \(property_name) = \(attr.value)")
            }
        }
    }
}

class OxFordWordPronuncation: NSObject {
    var spelling            : String = ""
    var pronounce           : String = ""
    
    override init() {
        super.init()
    }
}

class OxFordWordDes: NSObject {
    var shortCut            : String = ""
    var longDes             :[OxFordWordExample] = [OxFordWordExample]()
    
    override init() {
        super.init()
    }
}

class OxFordWordExample: NSObject {
    var desc                 : String = ""
    var examples             :[String] = [String]()
    
    override init() {
        super.init()
    }
}

class OxFordWordPhrasal: NSObject {
    var phrasal                 : String = ""
    var url                     : String = ""
    
    override init() {
        super.init()
    }
}

class OxFordWordNearBy: NSObject {
    var word                 : String = ""
    var wordClasses         : String = ""
    var url                  : String = ""
    
    override init() {
        super.init()
    }
}

//extension NSObject {
//    func printAttr(){
//        let mirrored_object = Mirror(reflecting: self)
//        for (index, attr) in mirrored_object.children.enumerated() {
//            if let property_name = attr.label as String! {
//                Swift.print("Attr \(index): \(property_name) = \(attr.value)")
//            }
//        }
//    }
//}

