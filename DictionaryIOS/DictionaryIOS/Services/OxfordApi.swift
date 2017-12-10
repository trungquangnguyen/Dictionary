//
//  OxfordApi.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

class OxfordAPI {
    static let baseURL = "http://www.oxfordlearnersdictionaries.com/definition/english/"
    
    static func search(key: String, complete: (_ object: OxFordWord?) -> Void){
        let tutorialURL = URL(string: "\(OxfordAPI.baseURL)\(key)")
        do {
            let data = try Data(contentsOf: tutorialURL!)
            let tFHppleObject = TFHpple(htmlData: data)
            let word = HTMLMapper<OxFordWord>().map(tFHpple: tFHppleObject)
            if word != nil {
                word!.keyWord = key
            }
            complete(word)
        } catch {
            complete(nil)
        }
    }
    
    static func searchSuggest(key: String, complete: (_ suggests: [String]) -> Void){
        
    }
}
