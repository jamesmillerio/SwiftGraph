//
//  AVLTree.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/4/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class AVLTree<T> : BinaryTree<T> where T : Comparable {
    
    override public init() {
        super.init()
        self.TraversalType = Traversal.DFS_Inorder
    }
    
    public override func Add(value: T) {
        super.Add(value: value)
    }
    
    override public func Balance(added: BinaryNode<T>) {
        super.Balance(added: added)

        if !added.Balanced {
            
            if let left = added.Left {
                if added.BalanceFactor > 1 && added.Value < left.Value {
                    self.RotateRight(node: added)
                }
            }
            
            if let right = added.Right {
                if added.BalanceFactor < -1 && added.Value > right.Value {
                    self.RotateLeft(node: added)
                }
            }
            
            if let left = added.Left {
                if added.BalanceFactor > 1 && added.Value > left.Value {
                    added.Left = self.RotateLeft(node: left)
                    self.RotateRight(node: added)
                }
            }
            
            if let right = added.Right {
                if added.BalanceFactor < -1 && added.Value < right.Value {
                    added.Right = self.RotateRight(node: right)
                    self.RotateLeft(node: added)
                }
            }
        }
    }
    
    override public func Balance(removed: BinaryNode<T>) {
        super.Balance(removed: removed)
        
        if let left = removed.Left {
            if removed.BalanceFactor > 1 && left.BalanceFactor >= 0 {
                self.RotateRight(node: removed)
            }
            
            if removed.BalanceFactor > 1 && left.BalanceFactor < 0
            {
                removed.Left = self.RotateLeft(node: left)
                self.RotateRight(node: removed)
            }
        }
        
        if let right = removed.Right {
            if removed.BalanceFactor < -1 && right.BalanceFactor <= 0 {
                self.RotateLeft(node: removed)
            }
            
            if removed.BalanceFactor < -1 && right.BalanceFactor > 0
            {
                removed.Right = self.RotateRight(node: right)
                self.RotateLeft(node: removed)
            }
        }
    }
    
    @discardableResult
    public func RotateLeft(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        guard let rightChild = node.Right else { return nil }
        guard let leftGrandchild = rightChild.Left else { return nil }
        
        //Rotate
        rightChild.Left = node
        node.Right = leftGrandchild
        
        //Update parents
        rightChild.Parent = node.Parent
        node.Parent = rightChild
        leftGrandchild.Parent = node
        
        return rightChild
    }
    
    @discardableResult
    public func RotateRight(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        guard let leftChild = node.Left else { return nil }
        guard let rightGrandChild = leftChild.Right else { return nil }
        
        //Rorate
        leftChild.Right = node
        node.Left = rightGrandChild
        
        //Update parents
        leftChild.Parent = node.Parent
        node.Parent = leftChild
        rightGrandChild.Parent = node
        
        return leftChild
    }
    
}
