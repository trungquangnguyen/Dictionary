//
//  JinMap.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/20/17.
//  Copyright © 2017 SSD. All rights reserved.
//

enum MapFrom {
    case TFHpple
    case TFHppleElement
}

enum MapType {
    case Array
    case Object
    case Content
    case Href
}

 final class HTMLMap {
    internal(set) var currentValue: Any?
    internal(set) var html: TFHpple?
    internal(set) var tfElement: TFHppleElement?
    
    init(html: TFHpple){
        self.html = html
    }
    
    init(element: TFHppleElement){
        self.tfElement = element
    }
    
    subscript(key: String, mapFrom: MapFrom) -> HTMLMap {
        return map(key: key, mapFrom: mapFrom)
    }
    
    func value<T>() -> T? {
        return currentValue as? T
    }
    
    private func map(key: String, mapFrom: MapFrom, mapType: MapType = .Content) -> HTMLMap {
        if html != nil && mapFrom == .TFHpple{
            let nodes = html!.search(withXPathQuery: key)
            setCurrentValue(nodes: nodes, mapType:  mapType)
        } else {
            if tfElement != nil && mapFrom == .TFHppleElement{
                setCurrentValue(nodes: tfElement!.search(withXPathQuery: key), mapType: mapType)
            }
        }
        return self
    }
    
    private func setCurrentValue(nodes: [Any]?,  mapType: MapType){
        switch mapType {
        case .Content:
            currentValue = (nodes?.first as? TFHppleElement)?.content ?? ""
            break
        case .Href:
            break
        case .Object:
            break
        case .Array:
            currentValue = nodes
            break
        }
    }
    
}
