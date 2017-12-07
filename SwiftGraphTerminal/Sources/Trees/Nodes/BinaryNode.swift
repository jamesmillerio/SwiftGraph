//
//  BinaryNode.swift
//  SwiftGraph
//
//  Created by James Miller on 11/30/17.
//

import Foundation

public class BinaryNode<T> : Comparable where T : Comparable {
    
    public static func <(lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.Value < rhs.Value
    }
    
    public static func ==(lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.Value == rhs.Value
    }
    
    convenience init(value: T) {
        self.init(value: value, color: Color.Red)
    }
    
    init(value: T, color: Color) {
        self.Value = value
        self.NodeColor = color
    }
    
    public var Left: BinaryNode<T>?
    public var Right: BinaryNode<T>?
    public var Parent: BinaryNode<T>?
    public var Value: T
    public var NodeColor: Color = Color.Red
    
    public var Height: Int {
        get {
            let leftHeight = self.Left?.Height ?? 0
            let rightHeight = self.Right?.Height ?? 0
            
            return max(leftHeight, rightHeight) + 1
        }
    }

    public var BalanceFactor: Int {
        get {
            let leftHeight = self.Left?.Height ?? 0
            let rightHeight = self.Right?.Height ?? 0
            
            return leftHeight - rightHeight
        }
    }
    
    public var Balanced: Bool {
        get { return abs(self.BalanceFactor) <= 1 }
    }
}
