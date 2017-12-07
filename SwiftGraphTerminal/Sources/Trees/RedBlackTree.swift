//
//  RedBlackTree.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/5/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class RedBlackTree<T> : BinaryTree<T> where T : Comparable {
    
    override public func Balance(added: BinaryNode<T>) {
        
        super.Balance(added: added)
        
        if added == self.Root {
            added.NodeColor = Color.Black
        }
        
        guard let parent = added.Parent else { return }
        guard let grandparent = parent.Parent else { return }
        
        if parent.NodeColor != Color.Black {
            
            let uncle = self.getUncle(node: added)
            let uncleColor = uncle?.NodeColor ?? Color.Black
            
            if uncleColor == Color.Red {
                
                parent.NodeColor = Color.Black
                uncle?.NodeColor = Color.Black
                grandparent.NodeColor = Color.Red
                
                self.Balance(added: grandparent)
                
            } else {
                
                let orientation = getNodeOrientation(child: added)
                
                switch orientation {
                case NodeOrientation.LeftLeft:
                    self.RotateRight(node: grandparent)
                    self.swapColors(left: grandparent, right: parent)
                case NodeOrientation.LeftRight:
                    self.RotateLeft(node: parent)
                    self.RotateRight(node: grandparent)
                    //self.swapColors(left: grandparent, right: parent)
                    self.swapColors(left: grandparent, right: added)
                case NodeOrientation.RightRight:
                    self.RotateLeft(node: grandparent)
                    self.swapColors(left: grandparent, right: parent)
                case NodeOrientation.RightLeft:
                    self.RotateRight(node: parent)
                    self.RotateLeft(node: grandparent)
                    //self.swapColors(left: grandparent, right: parent)
                    self.swapColors(left: grandparent, right: added)
                case NodeOrientation.None:
                    print("ORIENTATION NONE FOR NODE \(added.Value)")
                    return
                }
                
            }
            
        }
        
    }
    
    override public func Balance(removed: BinaryNode<T>) {
        super.Balance(removed: removed)
        
        
        
    }
    
    @discardableResult
    public func RotateLeft(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        guard let rightChild = node.Right else { return nil }
        
        //Rotate
        node.Right = rightChild.Left
        
        if let leftGrandchild = rightChild.Left {
            leftGrandchild.Parent = node
        }
        
        rightChild.Left = node
        
        //Update our parents
        rightChild.Parent = node.Parent
        node.Parent = rightChild
        
        //Update the root's new child
        if let parent = rightChild.Parent {
            print("Updating parent")
            if parent.Left == node {
                parent.Left = rightChild
            } else if parent.Right == node {
                parent.Right = rightChild
            }
        } else {
            self.Root = rightChild
        }
        
        return rightChild
    }
    
    @discardableResult
    public func RotateRight(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        guard let leftChild = node.Left else { return nil }
        
        //Rotate
        node.Left = leftChild.Right
        
        if let rightGrandchild = leftChild.Right {
            rightGrandchild.Parent = node
        }
        
        leftChild.Right = node
        
        //Update our parents
        leftChild.Parent = node.Parent
        node.Parent = leftChild
        
        //Update the root's new child
        if let parent = leftChild.Parent {
            if parent.Left == node {
                parent.Left = leftChild
            } else if parent.Right == node {
                parent.Right = leftChild
            }
        } else {
            self.Root = leftChild
        }
        
        return leftChild
    }
    
    private func getUncle(node: BinaryNode<T>) -> BinaryNode<T>? {
        
        guard let parent = node.Parent else { return nil }
        guard let grandparent = parent.Parent else { return nil }
        
        return grandparent.Left == parent ? grandparent.Right : grandparent.Left
    }
    
    private func swapColors(left: BinaryNode<T>, right: BinaryNode<T>) {
        let color = left.NodeColor
        left.NodeColor = right.NodeColor
        right.NodeColor = color
    }
    
    private func getNodeOrientation(child: BinaryNode<T>) -> NodeOrientation {
        
        guard let parent = child.Parent else { return NodeOrientation.None }
        guard let grandparent = parent.Parent else { return NodeOrientation.None }
        
        if nodeIsLeft(child: child, parent: parent) {
            
            if nodeIsLeft(child: parent, parent: grandparent) {
                return NodeOrientation.LeftLeft
            } else if nodeIsRight(child: parent, parent: grandparent) {
                return NodeOrientation.RightLeft
            } else {
                return NodeOrientation.None
            }
        
        } else if nodeIsRight(child: child, parent: parent) {
            
            if nodeIsRight(child: parent, parent: grandparent) {
                return NodeOrientation.RightRight
            } else if nodeIsLeft(child: parent, parent: grandparent) {
                return NodeOrientation.LeftRight
            } else {
                return NodeOrientation.None
            }
            
        } else {
            return NodeOrientation.None
        }
    }
    
    private func nodeIsLeft(child: BinaryNode<T>, parent: BinaryNode<T>) -> Bool {
        
        //Make sure the parent passed in is really the parent.
        if child.Parent != parent { return false }
        
        return parent.Left == child
    }
    
    private func nodeIsRight(child: BinaryNode<T>, parent: BinaryNode<T>) -> Bool {
        
        //Make sure the parent passed in is really the parent.
        if child.Parent != parent { return false }
        
        return parent.Right == child
    }
    
    override public func Print() {
        for item in self {
            let parentValue = item.Parent == nil ? "nil" : String(describing: item.Parent!.Value)
            print("\(item.Value)(\(item.NodeColor), Parent:\(parentValue)) ")
        }
        
        print("")
    }
    
}
