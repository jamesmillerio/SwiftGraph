//
//  NAryDFS.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class NAryDFS<T> : NAryTraversalBase<T> where T : Comparable {
    
    public typealias Element = NAryNode<T>
    
    private var items: Queue<NAryNode<T>> = Queue<NAryNode<T>>()
    private var traversalType: Traversal = Traversal.DFS_Inorder
    
    init(_ node: NAryNode<T>?, traversal : Traversal?) {
        
        super.init()
        
        //Set our traversal type if provided.
        if let traversal = traversal {
            self.traversalType = traversal
        }
        
        //Preprocess our tree
        if let node = node {
            self.convertToQueuePreorder(node)
        }
    }
    
    override public func next() -> NAryNode<T>? {
        return self.items.Dequeue()
    }
    
    private func convertToQueuePreorder(_ node: NAryNode<T>) {
        
        self.items.Enqueue(node)
        
        for child in node.Children {
            convertToQueuePreorder(child)
        }
        
    }
    
}
