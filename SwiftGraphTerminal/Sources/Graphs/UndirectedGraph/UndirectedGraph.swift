//
//  UndirectedGraph.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedGraph<T> : Sequence where T : Comparable, T : Hashable {
    
    public typealias Element = UndirectedVertex<T>
    
    public var Root: UndirectedVertex<T>?
    public var Vertexes: [UndirectedVertex<T>] = [UndirectedVertex<T>]()
    public var TraversalType: Traversal = Traversal.DFS_Inorder
    
    public func Add(value: T) -> UndirectedVertex<T> {
        let vertex = UndirectedVertex<T>(value: value)
        
        self.Add(vertex: vertex)
        
        return vertex
    }
    
    public func Add(vertex: UndirectedVertex<T>) {
        if self.Root == nil {
            self.Root = vertex
        }
        
        self.Vertexes.append(vertex)
    }
    
    public func Search(value: T) -> UndirectedVertex<T>? {
        for vertex in self {
            if vertex.Value == value {
                return vertex
            }
        }
        
        return nil
    }
    
    public func makeIterator() -> UndirectedGraphTraversalBase<T> {
        return UndirectedTraversalDFS<T>(self.Vertexes)
        /*switch self.TraversalType {
        case Traversal.BFS:
            return DirectedTraversalBFS<T>(self.Vertexes)
        case Traversal.DFS_Inorder, Traversal.DFS_Preorder, Traversal.DFS_Postorder:
            return DirectedTraversalDFS<T>(self.Vertexes)
        }*/
    }
    
    public func Print() {
        for item in self {
            print("\(item.Value)", terminator: "")
        }
        print("")
    }
    
}
