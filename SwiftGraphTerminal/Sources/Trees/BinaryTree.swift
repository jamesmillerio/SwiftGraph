//
//  BinaryTree.swift
//  SwiftGraph
//
//  Created by James Miller on 11/30/17.
//

import Foundation

public class BinaryTree<T> : Sequence where T: Comparable {
    
    public typealias Element = BinaryNode<T>
    
    public var Root : BinaryNode<T>?
    public var TraversalType : Traversal = Traversal.DFS_Inorder
    
    public init() { }
    
    public func Add(value: T) {
        let node = BinaryNode<T>(value: value)
        
        guard let root = self.Root else {
            
            //Just in case this is a red black tree
            node.NodeColor = Color.Black
            
            self.Root = node
            self.Balance(added: node)
            return
        }
        
        self.Add(node: node, to: root)
    }
    
    private func Add(node: BinaryNode<T>, to: BinaryNode<T>) {
        
        if node.Value < to.Value {
            if let left = to.Left {
                self.Add(node: node, to: left)
            } else {
                to.Left = node
                node.Parent = to
                
                //Now that we've done our insertion, balance our tree.
                self.Balance(added: node)
            }
        } else if node.Value > to.Value {
            if let right = to.Right {
                self.Add(node: node, to: right)
            } else {
                to.Right = node
                node.Parent = to
                
                //Now that we've done our insertion, balance our tree.
                self.Balance(added: node)
            }
        }
        
    }
    
    public func Remove(item: T) {
        guard let node = self.Search(value: item) else { return }
        self.Remove(node: node)
    }
    
    private func Remove(node: BinaryNode<T>) {
        
        if node.Left == nil && node.Right == nil {
            
            if let parent = node.Parent {
                if parent.Left == node {
                    parent.Left = nil
                } else if parent.Right == node {
                    parent.Right = nil
                }
                node.Parent = nil
                
                self.Balance(removed: node)
            }

        } else if node.Left != nil && node.Right != nil {
            
            if let smallest = self.FindNextSmallest(node: node.Right!) {
                
                node.Value = smallest.Value
                
                self.Remove(node: smallest)
                
            }
            
        } else {
            
            guard let child = node.Left ?? node.Right else { return }
            
            if let parent = node.Parent {
                
                if parent.Left == node {
                    parent.Left = child
                    child.Parent = parent
                } else if parent.Right == node {
                    parent.Right = child
                    child.Parent = parent
                }
                
            } else {
                
                child.Parent = nil
                self.Root = child
                
            }
            
            self.Balance(removed: node)
        }
    }
    
    private func FindNextSmallest(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        if let left = node.Left {
            return FindNextSmallest(node: left)
        }
        
        //Smallest node will always be a left node with
        //either no children or only a right child.
        return node
    }
    
    private func xor(left: Bool, right: Bool) -> Bool {
        return (left && !right) || (!left && right)
    }
    
    public func Search(value: T) -> BinaryNode<T>? {
        
        var current = self.Root
        
        while current != nil {
            if current!.Value == value {
                return current
            } else if value < current!.Value {
                current = current!.Left
            } else if value > current!.Value {
                current = current!.Right
            }
        }
        
        return nil
    }

    public func Balance(added: BinaryNode<T>) {
        
        //Does nothing by default
    }
    
    public func Balance(removed: BinaryNode<T>) {
        
        //Does nothing by default
    }
    
    public func makeIterator() -> TraversalBase<T> {
        switch self.TraversalType {
        case Traversal.BFS:
            return BFS<T>(self.Root)
        default:
            return DFS<T>(self.Root, traversal: self.TraversalType)
        }
    }
    
    public func Print() {

        for item in self {
            print("\(item.Value) ", terminator: "")
        }
        
        print("")
    }
    
}
