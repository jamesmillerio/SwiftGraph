//
//  NAryTree.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class NAryTree<T> : Sequence where T: Comparable {
    
    public typealias Element = NAryNode<T>
    
    public var Root : NAryNode<T>?
    public var TraversalType : Traversal = Traversal.DFS_Inorder
    
    public init() { }
    
    @discardableResult
    public func Add(value: T) -> NAryNode<T> {
        return self.Add(value: value, to: nil)
    }
    
    @discardableResult
    public func Add(value: T, to: NAryNode<T>?) -> NAryNode<T> {
        let node = NAryNode<T>(value: value)
        
        return self.Add(node: node, to: to)
    }
    
    @discardableResult
    private func Add(node: NAryNode<T>, to: NAryNode<T>?) -> NAryNode<T> {
        
        if let destination = to {
            destination.Children.append(node)
            node.Parent = destination
        } else {
            self.Root = node
        }
        
        return node
    }
    
    public func Remove(item: T) {
        guard let node = self.Search(value: item) else { return }
        self.Remove(node: node)
    }
    
    private func Remove(node: NAryNode<T>) {
        
        guard let parent = node.Parent else {
            //If the node passed in is the root, destroy the tree.
            self.Root = nil
            return
        }
        
        for (i, child) in parent.Children.enumerated() {
            if child == node {
                parent.Children.remove(at: i)
                node.Parent = nil
            }
        }
    }
    
    public func Search(value: T) -> NAryNode<T>? {
        
        if let node = self.Root {
            return self.Search(value: value, node: node)
        } else {
            return nil
        }
    }
    
    private func Search(value: T, node: NAryNode<T>) -> NAryNode<T>? {
        
        if node.Value == value {
            return node
        } else {
            for child in node.Children {
                if let result = self.Search(value: value, node: child) {
                    return result
                }
            }
        }
        return nil
    }
    
    public func makeIterator() -> NAryTraversalBase<T> {
        return NAryDFS<T>(self.Root, traversal: self.TraversalType)
    }
    
    public func Print() {
        
        for item in self {
            print("\(item.Value) ", terminator: "")
        }
        
        print("")
    }
    
}

