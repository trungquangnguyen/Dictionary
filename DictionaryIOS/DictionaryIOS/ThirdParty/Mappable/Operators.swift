//
//  Operators.swift
//  DictionaryIOS
//
//  Created by trung quang on 11/20/17.
//  Copyright © 2017 SSD. All rights reserved.
//

infix operator <-

func <- <T>(left: inout T, right: HTMLMap) {
        FromHTML.basicType(&left, object: right.value())
}

func <- <T>(left: inout Array<T>, right: HTMLMap) {
    //FromHTML.basicType(&left, object: right.value())
}

/// Object conforming to Mappable
//public func <- <T: BaseMappable>(left: inout T, right: Map) {
//    switch right.mappingType {
//    case .fromJSON:
//        FromJSON.object(&left, map: right)
//    case .toJSON:
//        left >>> right
//    }
//}


///// Array of Mappable objects
//public func <- <T: BaseMappable>(left: inout Array<T>, right: Map) {
//    switch right.mappingType {
//    case .fromJSON where right.isKeyPresent:
//        FromJSON.objectArray(&left, map: right)
//    case .toJSON:
//        left >>> right
//    default: ()
//    }
//}

