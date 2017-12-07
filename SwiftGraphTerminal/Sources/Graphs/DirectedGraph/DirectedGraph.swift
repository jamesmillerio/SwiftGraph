//
//  DirectedGraph.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedGraph<T> : Sequence where T : Comparable, T : Hashable {
    
    public typealias Element = DirectedVertex<T>
    
    public var Root: DirectedVertex<T>?
    public var Vertexes: [DirectedVertex<T>] = [DirectedVertex<T>]()
    public var TraversalType: Traversal = Traversal.DFS_Inorder
    
    public func Add(value: T) -> DirectedVertex<T> {
        let vertex = DirectedVertex<T>(value: value)
        
        self.Add(vertex: vertex)
        
        return vertex
    }
    
    public func Add(vertex: DirectedVertex<T>) {
        if self.Root == nil {
            self.Root = vertex
        }
        
        self.Vertexes.append(vertex)
    }
    
    public func Search(value: T) -> DirectedVertex<T>? {
        for vertex in self {
            if vertex.Value == value {
                return vertex
            }
        }
        
        return nil
    }
    
    public func Remove(value: T) {
        
        for item in self {
            
            for (i, edge) in item.Edges.enumerated() {
                
                if edge.Destination.Value == value {

                    item.Edges.remove(at: i)
                    
                }
            }
        }
        
    }
    
    public func makeIterator() -> DirectedGraphTraversalBase<T> {
        switch self.TraversalType {
        case Traversal.BFS:
            return DirectedTraversalBFS<T>(self.Vertexes)
        case Traversal.DFS_Inorder, Traversal.DFS_Preorder, Traversal.DFS_Postorder:
            return DirectedTraversalDFS<T>(self.Vertexes)
        }
    }

    public func Print() {
        for item in self {
            print("\(item.Value)", terminator: "")
        }
        print("")
    }
    
}
