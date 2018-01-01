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
        demoArrayObject               <- map["//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']/div[@class='top-g']/div[@class='pron-gs ei-g']//span[@class='pron-g']", .TFHpple, .ArrayObject]
    }
}

class OxFordWord: HTMLMappable {
    var keyWord             : String = ""
    var pronunciations      : [OxFordWordPronuncation] = [OxFordWordPronuncation]()
    var wordClasses         : [String] = [String]()
    var thumUrl             : String = ""
    var fullSizeUrl         : String = ""
    var verbForms           : [VerdForm] = [VerdForm]()
    var extraExamples       : [String] = [String]()
    var des                 : [OxFordWordDes] = [OxFordWordDes]()
    var idioms              : [String] = [String]()
    var phrsalVerbs         : [OxFordWordPhrasal] = [OxFordWordPhrasal]()
    var nearbyWords         : [OxFordWordNearBy]  = [OxFordWordNearBy]()
    var isLiked             : Bool = false
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        pronunciations               <- map["//div[@class='top-container']/div[@class='top-g']/div[@class='pron-gs ei-g']//span[@class='pron-g']", .TFHpple, .ArrayObject]
        wordClasses                  <- map["//div[@class='top-container']//div[@class='webtop-g']//span[@class='pos']", .TFHpple, .BaseArray]
        thumUrl                      <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']/div[@id='ox-enlarge']/a[@class='topic']/img[@class='thumb']", .TFHpple, .Attribute, "src"]
        fullSizeUrl                  <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']/li[@class='sn-g']/div[@id='ox-enlarge']/a[@class='topic']", .TFHpple, .Attribute, "href"]
        verbForms                    <- map["//div[@class='top-container']/div[@class='top-g']/span[@class='collapse']//span[@class='body']/span[@class='vp-g']", .TFHpple, .ArrayObject]
        idioms                       <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='idm-gs']//span[@class='x']", .TFHpple, .BaseArray]
        extraExamples                <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='res-g']/span[@title='Extra examples']//span[@class='x']", .TFHpple, .BaseArray]
        des                <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']", .TFHpple, .ArrayObject]
        phrsalVerbs        <- map["//div[@class='entry']/ol[@class='h-g']/span[@class='pv-gs']//a[@class='Ref']", .TFHpple, .ArrayObject]
        nearbyWords        <- map["//div[@class='responsive_entry_center_right']/div[@class='responsive_row nearby']/ul[@class='list-col']/li/a", .TFHpple, .ArrayObject]
    }
}

class OxFordWordPronuncation: HTMLMappable {
    var spelling            : String = ""
    var pronounce           : String = ""
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        spelling                  <- map["//span[@class='phon']", .TFHppleElement]
        pronounce                 <- map["", .TFHppleElement, .Attribute, "data-src-mp3", 3, true]
    }
}

class VerdForm: HTMLMappable {
    var example: String = ""
    var prounnications: [VerdFormSpell] = [VerdFormSpell]()
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        example                  <- map["//span[@class='vp']", .TFHppleElement]
        prounnications           <- map["//div[@class='pron-gs ei-g']/span[@class='pron-g']", .TFHppleElement, .ArrayObject]
    }
}

class VerdFormSpell: HTMLMappable {
    var spelling: String = ""
    var pronounceURL: String = ""
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        spelling                <- map["//span[@class='phon']", .TFHppleElement]
        pronounceURL             <- map["", .TFHppleElement, .Attribute, "data-src-mp3", 3, true]
    }
}

class OxFordWordDes: HTMLMappable {
    var shortCut            : String = ""
    var longDes             :[OxFordWordExample] = [OxFordWordExample]()
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        shortCut                <- map["//span[@class='shcut']", .TFHppleElement]
        longDes                 <- map["//li[@class='sn-g']", .TFHppleElement, .ArrayObject]
    }
}

class OxFordWordExample: HTMLMappable {
    var desc                 : String = ""
    var examples             :[String] = [String]()
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        desc                    <- map["//span[@class='def']", .TFHppleElement]
        examples                <- map["//span[@class='x']", .TFHppleElement, .BaseArray]
    }
}

class OxFordWordPhrasal: HTMLMappable {
    var phrasal                 : String = ""
    var url                     : String = ""
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        phrasal                    <- map["//span[@class='xh']", .TFHppleElement]
        url                        <- map["", .TFHppleElement, .Attribute, "href"]
    }
}

class OxFordWordNearBy: HTMLMappable {
    var word                 : String = ""
    var wordClasses          : String = ""
    var url                  : String = ""
    
    required convenience init?(map: HTMLMap) {
        self.init()
    }
    
    func mapping(map: HTMLMap) {
        word                    <- map["//data[@class='hwd']", .TFHppleElement]
        wordClasses             <- map["//data[@class='hwd']/pos", .TFHppleElement]
        url                     <- map["", .TFHppleElement, .Attribute, "href"]
    }
}
