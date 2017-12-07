//
//  DirectedTraversalBFS.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedTraversalBFS<T> : DirectedGraphTraversalBase<T> where T : Comparable, T : Hashable {
    
    public typealias Element = DirectedVertex<T>
    
    private var queue: Queue<DirectedVertex<T>> = Queue<DirectedVertex<T>>()
    private var results: Queue<DirectedVertex<T>> = Queue<DirectedVertex<T>>()
    private var visited: [DirectedVertex<T> : Int] = [DirectedVertex<T> : Int]()
    
    init(_ vertexes: [DirectedVertex<T>]?) {
        super.init()
        if let nodes = vertexes {
            for vertex in nodes {
                self.BFS(vertex: vertex, distance: 0)
            }
        }
    }
    
    private func BFS(vertex: DirectedVertex<T>, distance: Int) {
        
        self.queue.Enqueue(vertex)
        
        var currentDistance = distance
        
        while !self.queue.IsEmpty() {
            guard let current = self.queue.Dequeue() else { break }
            
            if self.visited[current] != nil {
                continue
            }
            
            //Mark as visited
            self.visited[current] = distance
            self.results.Enqueue(current)
            
            for edge in current.Edges {                
                self.queue.Enqueue(edge.Destination)
            }
            
            currentDistance += 1
        }
        
    }
    
    override public func next() -> DirectedVertex<T>? {
        return self.results.Dequeue()
    }
}
