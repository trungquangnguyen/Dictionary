//
//  JinMap.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/20/17.
//  Copyright © 2017 SSD. All rights reserved.
//

 final class HTMLMap {
    internal(set) var currentValue: Any?
    internal(set) var html: TFHpple?
    internal(set) var tfElement: TFHppleElement?
    
    init(html: TFHpple){
        self.html = html
    }
    
    public init(element: TFHppleElement){
        self.tfElement = element
    }
    
     func value<T>() -> T? {
        return currentValue as? T
    }
    
     subscript(key: String) -> HTMLMap {
        return map(key: key)
    }
    
    private func map(key: String) -> HTMLMap {
        if html != nil {
            let nodes = html?.search(withXPathQuery: key)
            let chils = (nodes?.first as? TFHppleElement)?.children
            currentValue = (chils?.first as? TFHppleElement)?.content ?? ""
        } else {
            if tfElement != nil {
                let chil = tfElement?.search(withXPathQuery: key).first as? TFHppleElement
                currentValue = chil?.content ?? ""
            }
        }
        return self
    }
    
}
