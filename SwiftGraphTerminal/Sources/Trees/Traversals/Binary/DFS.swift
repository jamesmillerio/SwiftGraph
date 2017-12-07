//
//  DFS.swift
//  SwiftGraph
//
//  Created by James Miller on 12/1/17.
//

import Foundation

public class DFS<T> : TraversalBase<T> where T : Comparable {
    
    public typealias Element = BinaryNode<T>
    
    private var items: Queue<BinaryNode<T>> = Queue<BinaryNode<T>>()
    private var traversalType: Traversal = Traversal.DFS_Inorder
    
    init(_ node: BinaryNode<T>?, traversal : Traversal?) {
        
        super.init()
        
        //Set our traversal type if provided.
        if let traversal = traversal {
            self.traversalType = traversal
        }
        
        //Preprocess our tree
        if let node = node {
            switch self.traversalType {
            case Traversal.DFS_Preorder: self.convertToQueuePreorder(node)
            case Traversal.DFS_Inorder: self.convertToQueueInorder(node)
            case Traversal.DFS_Postorder: self.convertToQueuePostorder(node)
            default: self.convertToQueueInorder(node)
            }
            
        }
    }
    
    override public func next() -> BinaryNode<T>? {
        return self.items.Dequeue()
    }
    
    private func convertToQueuePreorder(_ node: BinaryNode<T>) {
        
        self.items.Enqueue(node)
        
        if let left = node.Left {
            convertToQueuePreorder(left)
        }
        
        if let right = node.Right {
            convertToQueuePreorder(right)
        }
        
    }
    
    private func convertToQueueInorder(_ node: BinaryNode<T>) {
        
        if let left = node.Left {
            convertToQueueInorder(left)
        }
        
        self.items.Enqueue(node)
        
        if let right = node.Right {
            convertToQueueInorder(right)
        }
        
    }
    
    private func convertToQueuePostorder(_ node: BinaryNode<T>) {
        
        if let left = node.Left {
            convertToQueuePostorder(left)
        }
        
        if let right = node.Right {
            convertToQueuePostorder(right)
        }
        
        self.items.Enqueue(node)
    }
    
}
