//
//  UndirectedTraversalDFS.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedTraversalDFS<T> : DirectedGraphTraversalBase<T> where T : Comparable, T : Hashable {
    
    public typealias Element = DirectedVertex<T>
    
    private var queue: Queue<DirectedVertex<T>> = Queue<DirectedVertex<T>>()
    private var visited: [DirectedVertex<T> : TraversalColor] = [DirectedVertex<T> : TraversalColor]()
    
    init(_ vertexes: [DirectedVertex<T>]?) {
        super.init()
        if let nodes = vertexes {
            for vertex in nodes {
                self.DFS(vertex: vertex)
            }
        }
    }
    
    private func DFS(vertex: DirectedVertex<T>) {
        
        self.visited[vertex] = TraversalColor.Gray
        self.queue.Enqueue(vertex)
        
        for edge in vertex.Edges {
            if self.visited[edge.Destination] == nil {
                self.DFS(vertex: edge.Destination)
            }
        }
        
        self.visited[vertex] = TraversalColor.Black
    }
    
    override public func next() -> DirectedVertex<T>? {
        return self.queue.Dequeue()
    }
}
