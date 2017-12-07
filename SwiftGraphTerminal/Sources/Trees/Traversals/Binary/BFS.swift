//
//  BFS.swift
//  SwiftGraph
//
//  Created by James Miller on 12/1/17.
//

import Foundation

import Foundation

public class BFS<T> : TraversalBase<T> where T : Comparable {
    
    public typealias Element = BinaryNode<T>
    private var result: Queue<BinaryNode<T>> = Queue<BinaryNode<T>>()
    private var processing: Queue<BinaryNode<T>> = Queue<BinaryNode<T>>()
    
    private var current: BinaryNode<T>?
    
    init(_ node: BinaryNode<T>?) {
        
        super.init()
        
        if let node = node {
            self.processing.Enqueue(node)
            self.convertToQueue()
        }
    }
    
    override public func next() -> BinaryNode<T>? {
        return self.result.Dequeue()
    }
    
    private func convertToQueue() {
        
        while(!self.processing.IsEmpty()) {
            
            guard let item = self.processing.Dequeue() else { break }
            
            if let left = item.Left {
                self.processing.Enqueue(left)
            }
            
            if let right = item.Right {
                self.processing.Enqueue(right)
            }
            
            self.result.Enqueue(item)
        }
        
        /*if let left = node.Left {
            convertToQueue(left)
        }
        
        if let right = node.Right {
            convertToQueue(right)
        }*/
    }
    
}
