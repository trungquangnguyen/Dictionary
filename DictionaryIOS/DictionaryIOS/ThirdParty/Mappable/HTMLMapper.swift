//
//  HTMLMapper.swift
//  DictionaryIOS
//
//  Created by SSD on 11/22/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import Foundation

final class HTMLMapper<N: HTMLBaseMappable> {
    
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
}
