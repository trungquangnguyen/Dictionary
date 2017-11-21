//
//  JinMap.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/20/17.
//  Copyright © 2017 SSD. All rights reserved.
//

public final class JinMap {
    public internal(set) var currentValue: Any?
    
    public func value<T>() -> T? {
        return currentValue as? T
    }
}
