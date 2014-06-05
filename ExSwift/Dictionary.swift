//
//  Dictionary.swift
//  ExSwift
//
//  Created by pNre on 04/06/14.
//  Copyright (c) 2014 pNre. All rights reserved.
//

import Foundation

extension Dictionary {

    /**
    *  Checks if the specified key exists in the dictionary
    *  @param key Key to check
    *  @return true if the key exists
    */
    func has (key: KeyType) -> Bool {

        return indexForKey(key) != nil

    }
    
    /**
    *  Creates a Dictionary with the same keys as self and values generated by running
    *  each (key, value) of self through the mapFunction
    *  @param mapFunction
    *  @return Mapped dictionary
    */
    func mapValues(mapFunction map: (KeyType, ValueType) -> (ValueType)) -> Dictionary<KeyType, ValueType> {

        var mapped = Dictionary<KeyType, ValueType>()

        self.each({
            mapped[$0] = map($0, $1)
        })

        return mapped

    }
    
    /**
    *  Creates a Dictionary with keys and values generated by running
    *  each (key, value) of self through the mapFunction
    *  @param mapFunction
    *  @return Mapped dictionary
    */
    func map(mapFunction map: (KeyType, ValueType) -> (KeyType, ValueType)) -> Dictionary<KeyType, ValueType> {

        var mapped = Dictionary<KeyType, ValueType>()

        self.each({
            let (_key, _value) = map($0, $1)
            mapped[_key] = _value
        })

        return mapped
        
    }
    
    /**
    *  Loops trough each (key, value) couple in self
    *  @param eachFunction
    */
    func each(eachFunction each: (KeyType, ValueType) -> ()) {

        for (key, value) in self {
            each(key, value)
        }

    }
    
}
