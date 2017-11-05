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
    var examples            : [OxFordWordExample]?
    var idioms              : [OxFordIdiom]?
    var phrasalVerbs        : [String]?
    var nearbyWords         : [String]?
    
    override init() {
        super.init()
    }
}

class OxFordWordPronuncation: NSObject {
    var areaKey             : String?
    var spelling            : String?
    var pronounce           : String?
    
    override init() {
        super.init()
    }
}

class OxFordWordExample: NSObject {
    var desc                : String?
    var examples             :[String]?
    
    override init() {
        super.init()
    }
}

class OxFordIdiom: NSObject {
    var title                       : String?
    var desc                        : String?
    var idioms                      : [String]?
    
    override init() {
        super.init()
    }
}
