//
//  ViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 6/1/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let key = "work"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWord(key: key)
        label.text = NSLocalizedString("common_cancel_button", comment: "")
    }
}

extension ViewController {
    func loadWord(key: String){
        let word = OxFordWord()
        word.keyWord = key
       let tutorialURL = URL(string: "http://www.oxfordlearnersdictionaries.com/definition/english/\(key)")
        do {
            let data = try Data(contentsOf: tutorialURL!)
            let tFHppleObject = TFHpple(htmlData: data)
            word.pronunciations = getPronunciation(data: tFHppleObject)
            word.wordClasses = getWordClasses(data: tFHppleObject)
            word.print()
        } catch {
        }
    }
    
    func getPronunciation(data: TFHpple?) -> [OxFordWordPronuncation]{
        var objects = [OxFordWordPronuncation]()
        let xpathQueryString = "//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']/div[@class='top-g']/div[@class='pron-gs ei-g']//span[@class='pron-g']"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        for element in nodes! {
            let object = OxFordWordPronuncation()
            let step1 = (element as! TFHppleElement)
            if step1.children.count > 2 {
                let step2 = (step1.children[2]) as! TFHppleElement
                if step2.children.count > 3 {
                    let spellingTF = step2.children[3] as? TFHppleElement
                    object.spelling = spellingTF?.content ?? ""
                }
            }
            
            if step1.children.count > 3 {
                let step2 = (step1.children[3]) as? TFHppleElement
                object.pronounce = step2?.object(forKey: "data-src-mp3") ?? ""
            }
            objects.append(object)
            print(object.spelling)
            print(object.pronounce)
        }
        return objects
    }
    
    func getWordClasses(data: TFHpple?) -> String{
        var wordClasses = ""
        let xpathQueryString = "//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//div[@class='webtop-g']//span[@class='pos']"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        let chils = (nodes?.first as? TFHppleElement)?.children
        wordClasses = (chils?.first as? TFHppleElement)?.content ?? ""
        return wordClasses
    }
}
