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
    fileprivate func loadWord(key: String){
        let word = OxFordWord()
        word.keyWord = key
       let tutorialURL = URL(string: "http://www.oxfordlearnersdictionaries.com/definition/english/\(key)")
        do {
            let data = try Data(contentsOf: tutorialURL!)
            let tFHppleObject = TFHpple(htmlData: data)
            let object = HTMLMapper<Demo>().map(tFHpple: tFHppleObject)
            print(object?.string ?? "______")
            word.pronunciations = getPronunciation(data: tFHppleObject)
            word.wordClasses = getWordClasses(data: tFHppleObject)
//            word.des = getWordExample(data: tFHppleObject)
//            word.idioms = getContents(data: tFHppleObject, key: "//div[@class='entry']/ol[@class='h-g']/span[@class='idm-gs']//span[@class='x']")
//            word.phrsalVerbs = getPhrasal(data: tFHppleObject)
//            word.nearbyWords = nearbyWords(data: tFHppleObject)
//            //word.print()
        } catch {
            print("loadWord Error")
        }
    }
    
    private func getPronunciation(data: TFHpple?) -> [OxFordWordPronuncation]{
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
        }
        return objects
    }
    
    private func getWordClasses(data: TFHpple?) -> String{
        var wordClasses = ""
        let xpathQueryString = "//div[@class='entry']/ol[@class='h-g']/div[@class='top-container']//div[@class='webtop-g']//span[@class='pos']"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        let chils = (nodes?.first as? TFHppleElement)?.children
        wordClasses = (chils?.first as? TFHppleElement)?.content ?? ""
        return wordClasses
    }
    
    private func getWordExample(data: TFHpple?) -> [OxFordWordDes]{
        var objects = [OxFordWordDes]()
        let xpathQueryString = "//div[@class='entry']/ol[@class='h-g']/span[@class='sn-gs']"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        for chil in nodes! {
            let object = OxFordWordDes()
            let shortcutQueryString = "//span[@class='shcut']"
            object.shortCut = getContent(element: chil as! TFHppleElement, key: shortcutQueryString)
            
            let listLongDesQueryString = "//li[@class='sn-g']"
            object.longDes = getLongDes(element: chil as! TFHppleElement, key: listLongDesQueryString)
            objects.append(object)
        }
        return objects
    }
    
    private func getLongDes(element: TFHppleElement, key: String) -> [OxFordWordExample] {
        var objects = [OxFordWordExample]()
        let nodes = element.search(withXPathQuery: key)
        for chil in nodes! {
            let object = OxFordWordExample()
            let desQueryString = "//span[@class='def']"
            object.desc = getContent(element: chil as! TFHppleElement, key: desQueryString)
            let exampleQueryString = "//span[@class='x']"
            object.examples = getContents(element: chil as! TFHppleElement, key: exampleQueryString)
            objects.append(object)
        }
        return objects
    }
    
    private func getPhrasal(data: TFHpple?) -> [OxFordWordPhrasal] {
        var objects = [OxFordWordPhrasal]()
        let xpathQueryString = "//div[@class='entry']/ol[@class='h-g']/span[@class='pv-gs']//a[@class='Ref']"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        for chil in nodes! {
            let object = OxFordWordPhrasal()
            object.phrasal = (chil as! TFHppleElement).content
            object.url = (chil as! TFHppleElement).object(forKey: "href")
            objects.append(object)
        }
        return objects
    }
    
    private func nearbyWords(data: TFHpple?) -> [OxFordWordNearBy] {
        var objects = [OxFordWordNearBy]()
        let xpathQueryString = "//div[@class='responsive_entry_center_right']/div[@class='responsive_row nearby']/ul[@class='list-col']/li/a"
        let nodes = data?.search(withXPathQuery: xpathQueryString)
        for chil in nodes! {
            let object = OxFordWordNearBy()
            
            object.word = getContent(element: chil as! TFHppleElement, key: "//data[@class='hwd']")
            object.wordClasses = getContent(element: chil as! TFHppleElement, key: "//data[@class='hwd']/pos")
            object.url = (chil as! TFHppleElement).object(forKey: "href")
            objects.append(object)
        }
        return objects
    }
    
    private func getContent(element: TFHppleElement, key: String) -> String{
        let chil = element.search(withXPathQuery: key).first as? TFHppleElement
        return chil?.content ?? ""
    }
    
    private func getContents(element: TFHppleElement, key: String) -> [String]{
        var strings = [String]()
        let nodes = element.search(withXPathQuery: key)
        for chil in nodes! {
            let content = (chil as! TFHppleElement).content ?? ""
            strings.append(content)
        }
        return strings
    }
    
    private func getContents(data: TFHpple?, key: String) -> [String]{
        var strings = [String]()
        let nodes = data?.search(withXPathQuery: key)
        for chil in nodes! {
            let content = (chil as! TFHppleElement).content ?? ""
            strings.append(content)
        }
        return strings
    }

}
