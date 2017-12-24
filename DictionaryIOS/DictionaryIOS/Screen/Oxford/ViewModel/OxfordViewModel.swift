//
//  WordViewModel.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/20/17.
//  Copyright © 2017 SSD. All rights reserved.
//

struct WordViewModel {
    var keyWord             : String = ""
    var pronunciations      : [PronuncationViewModel] = [PronuncationViewModel]()
    var wordClasses         : String = ""
    var thumUrl             : String = ""
    var fullSizeUrl         : String = ""
    var verbForms           : [VerdForm] = [VerdForm]()
    var extraExamples       : [String] = [String]()
    var des                 : [OxFordWordDes] = [OxFordWordDes]()
    var idioms              : [String] = [String]()
    var phrsalVerbs         : [OxFordWordPhrasal] = [OxFordWordPhrasal]()
    var nearbyWords         : [OxFordWordNearBy]  = [OxFordWordNearBy]()
    var isLiked             : Bool = false
}

extension WordViewModel {
    init(word: OxFordWord) {
        self.keyWord = word.keyWord
        self.pronunciations = PronuncationViewModel.getPronuncationViewModels(pronunications: word.pronunciations)
        self.wordClasses = getWordClass(strings: word.wordClasses)
        self.thumUrl = word.thumUrl
        self.fullSizeUrl = word.fullSizeUrl
        self.verbForms = word.verbForms
        self.extraExamples = word.extraExamples
        self.des = word.des
        self.idioms = word.idioms
        self.phrsalVerbs = word.phrsalVerbs
        self.nearbyWords = word.nearbyWords
        self.isLiked = word.isLiked
    }
    
    private func getWordClass(strings: [String]) -> String {
        return strings.joined(separator: ", ")
    }
}

struct PronuncationViewModel {
    var spelling            : String = ""
    var pronounce           : String = ""
    var isAmericanVoice      : Bool = true
}

extension PronuncationViewModel {
    init(pronuncation: OxFordWordPronuncation) {
        self.spelling = formatSpelling(string: pronuncation.spelling)
        self.pronounce = pronuncation.pronounce
    }
    
    private mutating func formatSpelling(string: String) -> String{
        var spelling = string.lowercased()
        if spelling.contains("bre"){
            self.isAmericanVoice = false
        }
        spelling = spelling.replacingOccurrences(of: "name", with: "")
        spelling = spelling.replacingOccurrences(of: "bre", with: "")
        spelling = spelling.replacingOccurrences(of: "//", with: "/")
        return spelling
    }
    
    static func getPronuncationViewModels(pronunications: [OxFordWordPronuncation]) -> [PronuncationViewModel]{
        var array = [PronuncationViewModel]()
        for pronunication in pronunications {
            let viewModel = PronuncationViewModel(pronuncation: pronunication)
            array.append(viewModel)
        }
        return array
    }
}
