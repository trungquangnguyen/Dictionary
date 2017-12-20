//
//  Dynamic.swift
//  DictionaryIOS
//
//  Created by trung quang on 10/29/17.
//  Copyright © 2017 SSD. All rights reserved.
//

//class Dynamic<T> {
//    typealias Listener = (T) -> ()
//    var listener: Listener?
//
//    func bind(_ listener: Listener?) {
//        self.listener = listener
//    }
//
//    func bindAndFire(_ listener: Listener?) {
//        self.listener = listener
//        listener?(value)
//    }
//
//    var value: T {
//        didSet {
//            listener?(value)
//        }
//    }
//
//    init(_ v: T) {
//        value = v
//    }
//}


class Dynamic<T> {
    
    var bind :(T) -> () = { _ in }
    
    var value :T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v :T) {
        value = v
    }
    
}

