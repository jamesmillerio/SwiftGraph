//
//  UndirectedVertex.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedVertex<T> : Comparable, Hashable where T : Comparable, T : Hashable {
    
    public var hashValue: Int {
        get {
            return self.Value.hashValue
        }
    }
    
    public static func <(lhs: UndirectedVertex<T>, rhs: UndirectedVertex<T>) -> Bool {
        return lhs.Value < rhs.Value
    }
    
    public static func ==(lhs: UndirectedVertex<T>, rhs: UndirectedVertex<T>) -> Bool {
        return lhs.Value == rhs.Value
    }
    
    public var Edges: [UndirectedEdge<T>] = [UndirectedEdge<T>]()
    public var Value: T
    
    public init(value: T) {
        self.Value = value
    }

    public func Add(value: T) -> UndirectedVertex<T> {
        let vertex = UndirectedVertex<T>(value: value)
        
        self.Add(vertex: vertex, source: self)
        
        return vertex
    }
    
    public func Add(vertex: UndirectedVertex<T>) -> UndirectedVertex<T> {
        self.Add(vertex: vertex, source: self)
        
        return vertex
    }
    
    public func Add(vertex: UndirectedVertex<T>, source: UndirectedVertex<T>) {
        let edge = UndirectedEdge<T>(destination: vertex, source: source)
        
        self.Edges.append(edge)
    }
    
}
