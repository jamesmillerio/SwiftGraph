//
//  NAryNode.swift
//  SwiftGraph
//
//  Created by James Miller on 11/30/17.
//

import Foundation

public class NAryNode<T> : Comparable where T : Comparable {
    
    init(value: T) {
        self.Value = value
    }
    
    public static func <(lhs: NAryNode<T>, rhs: NAryNode<T>) -> Bool {
        return lhs.Value < rhs.Value
    }
    
    public static func ==(lhs: NAryNode<T>, rhs: NAryNode<T>) -> Bool {
        return lhs.Value == rhs.Value
    }
    
    public var Parent: NAryNode<T>?
    public var Children: [NAryNode<T>] = [NAryNode<T>]()
    public var Value: T
}
