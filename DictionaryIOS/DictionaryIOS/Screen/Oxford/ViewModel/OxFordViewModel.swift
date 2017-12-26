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
    var verbForms           : [VerbFormsViewModel] = [VerbFormsViewModel]()
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
        self.verbForms = VerbFormsViewModel.getVerbFormsViewModels(verbForms: word.verbForms)
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
    
    //MARK: - PronuncationViewModel Static Func
    static func getPronuncationViewModels(pronunications: [OxFordWordPronuncation]) -> [PronuncationViewModel]{
        var array = [PronuncationViewModel]()
        for pronunication in pronunications {
            let viewModel = PronuncationViewModel(pronuncation: pronunication)
            array.append(viewModel)
        }
        return array
    }
}

struct VerbFormsViewModel {
    var example                     : String = ""
    var exampleAtt                  : NSMutableAttributedString = NSMutableAttributedString()
    var englishSpelling             : String = ""
    var englishPronuncation         : String = ""
    var americanSpelling            : String = ""
    var americanPronuncation        : String = ""
}

extension VerbFormsViewModel {
    init(wordForm: VerdForm){
        self.example = wordForm.example.trimmingCharacters(in: .whitespaces)
        let childs = ["present simple",
                      "past simple",
                      "past participle",
                      "-ing form"]
        let fonts = [AppFonts.nameFontCell]
        self.exampleAtt = self.example.mutableAttString(defaultFont: AppFonts.descriptionFont, chilsFont: fonts, chils: childs)
        self.englishSpelling = getSpelling(verbFormSpell: wordForm.prounnications.get(at: 0))
        self.englishPronuncation = getPronuncation(verbFormSpell: wordForm.prounnications.get(at: 0))
        self.americanSpelling = getSpelling(verbFormSpell: wordForm.prounnications.get(at: 1))
        self.americanPronuncation = getPronuncation(verbFormSpell: wordForm.prounnications.get(at: 1))
    }
    
    private func getSpelling(verbFormSpell: VerdFormSpell?) -> String{
        guard verbFormSpell != nil else {
            return ""
        }
        return formatSpelling(string: verbFormSpell!.spelling)
    }
    
    private func getPronuncation(verbFormSpell: VerdFormSpell?) -> String{
        guard verbFormSpell != nil else {
            return ""
        }
        return verbFormSpell!.pronounceURL
    }
    
    private func formatSpelling(string: String) -> String{
        var spelling = string.lowercased()
        if spelling.contains("bre"){
        }
        spelling = spelling.replacingOccurrences(of: "name", with: "")
        spelling = spelling.replacingOccurrences(of: "bre", with: "")
        spelling = spelling.replacingOccurrences(of: "//", with: "/")
        return spelling
    }
    
    //MARK: - VerbFormsViewModel Static Func
    static func getVerbFormsViewModels(verbForms: [VerdForm]) -> [VerbFormsViewModel]{
        var array = [VerbFormsViewModel]()
        for verbForm in verbForms {
            let viewModel = VerbFormsViewModel(wordForm: verbForm)
            array.append(viewModel)
        }
        return array
    }
}
