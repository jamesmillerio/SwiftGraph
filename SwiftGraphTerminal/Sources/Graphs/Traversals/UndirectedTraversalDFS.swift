//
//  UndirectedTraversalDFS.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedTraversalDFS<T> : UndirectedGraphTraversalBase<T> where T : Comparable, T : Hashable {
    
    public typealias Element = UndirectedVertex<T>
    
    private var queue: Queue<UndirectedVertex<T>> = Queue<UndirectedVertex<T>>()
    private var visited: [UndirectedVertex<T> : TraversalColor] = [UndirectedVertex<T> : TraversalColor]()
    
    init(_ vertexes: [UndirectedVertex<T>]?) {
        super.init()
        if let nodes = vertexes {
            for vertex in nodes {
                self.DFS(vertex: vertex)
            }
        }
    }
    
    private func DFS(vertex: UndirectedVertex<T>) {
        
        self.visited[vertex] = TraversalColor.Gray
        self.queue.Enqueue(vertex)
        
        for edge in vertex.Edges {
            if self.visited[edge.DestinationVertex] == nil {
                self.DFS(vertex: edge.DestinationVertex)
            }
        }
        
        self.visited[vertex] = TraversalColor.Black
    }
    
    override public func next() -> UndirectedVertex<T>? {
        return self.queue.Dequeue()
    }
}
