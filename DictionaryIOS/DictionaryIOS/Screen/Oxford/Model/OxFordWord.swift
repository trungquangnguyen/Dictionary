//
//  OxFordWord.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/5/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
class Demo: HTMLMappable {
    var wordClasses         : String = ""
    var thumUrl             : String = ""
    var fullSizeUrl         : String = ""
    var isLiked             : Bool = false
    var idioms              : [String] = [String]()
    var demo                : OxFordWordPronuncation = OxFordWordPronuncation()
    var demoArrayObject     : [OxFordWordPronuncation] = [OxFordWordPronuncation]()
    
    required convenience init?(map: HTMLMap) {
       self.init()
    }
    
    func mapping(map: HTMLMap) {
        wordClasses                  <- map["//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//div[@class='webtop-g']//span[@class='pos']", .TFHpple]
        idioms                       <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='idm-gs']//span[@class='x']", .TFHpple, .BaseArray]
        thumUrl                      <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']/div[@id='ox-enlarge']/a[@class='topic']/img[@class='thumb']", .TFHpple, .Attribute, "src"]
        fullSizeUrl                  <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']/div[@id='ox-enlarge']/a[@class='topic']", .TFHpple, .Attribute, "href"]
        demo                         <- map["//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']/div[@class='top-g']/div[@class='pron-gs ei-g']//span[@class='pron-g']", .TFHpple, .Object]
        demoArrayObject                         <- map["//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']/div[@class='top-g']/div[@class='pron-gs ei-g']//span[@class='pron-g']", .TFHpple, .ArrayObject]
    }
}

class OxFordWord: NSObject {
    var keyWord             : String = ""
    var pronunciations      : [OxFordWordPronuncation]?
    var wordClasses         : String = ""
    var thumUrl             : String = ""
    var fullSizeUrl         : String = ""
    var verbForms           : String = "TAo object"
    var extraExamples       : [String] = [String]()
    var des                 : [OxFordWordDes] = [OxFordWordDes]()
    var idioms              : [String] = [String]()
    var phrsalVerbs         : [OxFordWordPhrasal] = [OxFordWordPhrasal]()
    var nearbyWords         : [OxFordWordNearBy]  = [OxFordWordNearBy]()
    var isLiked             : Bool = false
    
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

class OxFordWordPronuncation: HTMLMappable {
    var spelling            : String = ""
    var pronounce           : String = ""
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        spelling                  <- map["//span[@class='phon']", .TFHppleElement, 3, true]
        pronounce                 <- map["", .TFHppleElement, .Attribute, "data-src-mp3", 3, true]
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
