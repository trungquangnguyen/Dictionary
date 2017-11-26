//
//  HTMLMapper.swift
//  DictionaryIOS
//
//  Created by SSD on 11/22/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import Foundation

final class HTMLMapper<N: HTMLBaseMappable> {
    var tFHpple: TFHpple?
    var tfHppleElement: TFHppleElement?
    
    func map(tFHpple: TFHpple?) -> N? {
        if let tFHpple = tFHpple {
            let map = HTMLMap(html: tFHpple)
            if let klass = N.self as? HTMLMappable.Type { // Check if object is Mappable
                if var object = klass.init(map: map) as? N {
                    object.mapping(map: map)
                    return object
                }
                return nil
            }
            return nil
        }
        return nil
    }
    
    func map(element: TFHppleElement?) -> N? {
        if let element = element {
            let map = HTMLMap(element: element)
            if let klass = N.self as? HTMLMappable.Type { // Check if object is Mappable
                if var object = klass.init(map: map) as? N {
                    object.mapping(map: map)
                    return object
                }
                return nil
            }
            return nil
        }
        return nil
    }
    
    public func mapArrayObject(elements: [TFHppleElement]) -> [N] {
        let result = elements.flatMap(map)
        return result
    }
}

