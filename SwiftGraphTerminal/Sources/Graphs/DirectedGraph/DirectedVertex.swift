//
//  DirectedVertex.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedVertex<T> : Comparable, Hashable where T : Comparable, T : Hashable {
    
    public var hashValue: Int {
        get {
            return self.Value.hashValue
        }
    }
    
    public static func <(lhs: DirectedVertex<T>, rhs: DirectedVertex<T>) -> Bool {
        return lhs.Value < rhs.Value
    }
    
    public static func ==(lhs: DirectedVertex<T>, rhs: DirectedVertex<T>) -> Bool {
        return lhs.Value == rhs.Value
    }
    
    public var Edges: [DirectedEdge<T>] = [DirectedEdge<T>]()
    public var Value: T
    
    public init(value: T) {
        self.Value = value
    }
    
    public func Add(value: T) -> DirectedVertex<T> {
        let vertex = DirectedVertex<T>(value: value)
        
        self.Add(vertex: vertex)
        
        return vertex
    }
    
    public func Add(vertex: DirectedVertex<T>) {
        let edge = DirectedEdge<T>(destination: vertex)
        
        self.Edges.append(edge)
    }
    
}
