//
//  NAryTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class NAryTesting : TestSuite {
    
    public var SuiteName: String { get { return "N-Ary Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Tree Creation and Insertion"] = creationAndInsertionTest
        self.Tests["Removal"] = searchAndremoval
        
    }
    
    func creationAndInsertionTest() -> Bool {
        
        var result = true
        let tree = NAryTree<Int>()
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 10),
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 2),
            BinaryNode<Int>(value: 20),
            BinaryNode<Int>(value: 21),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 23),
            BinaryNode<Int>(value: 24),
            BinaryNode<Int>(value: 3),
            BinaryNode<Int>(value: 4),
            BinaryNode<Int>(value: 5)]
        
        print("This test creates and adds values to an N-Ary Tree.")
        print("--------------------------------")
        
        let root = tree.Add(value: 10)
        print("Added 10 as root.")
        tree.Add(value: 1, to: root)
        
        let two = tree.Add(value: 2, to: root)
        
        tree.Add(value: 3, to: root)
        tree.Add(value: 4, to: root)
        tree.Add(value: 5, to: root)
        print("Added 1, 2, 3, 4, 5 as children of 10.")
        
        tree.Add(value: 20, to: two)
        tree.Add(value: 21, to: two)
        tree.Add(value: 22, to: two)
        tree.Add(value: 23, to: two)
        tree.Add(value: 24, to: two)
        print("Added 20, 21, 22, 23, 24 as children of 2.")
        
        print("Checking that items are added to tree properly using traversal.")
        
        for (i, ans) in expected.enumerated() {
            for (j, node) in tree.enumerated() {
                
                if i != j { continue }
                
                print("Expected: \(ans.Value) Got: \(node.Value)", terminator: "")
                
                if ans.Value == node.Value {
                    print("  PASSED")
                } else {
                    result = false
                    print("  FAILED")
                }
            }
        }
        
        return result
    }
    
    func searchAndremoval() -> Bool {
        
        var result = true
        let tree = NAryTree<Int>()
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 10),
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 2),
            BinaryNode<Int>(value: 20),
            //BinaryNode<Int>(value: 21),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 23),
            BinaryNode<Int>(value: 24),
            BinaryNode<Int>(value: 3),
            BinaryNode<Int>(value: 4),
            BinaryNode<Int>(value: 5)]
        
        print("This test creates and adds values to an N-Ary Tree.")
        print("--------------------------------")
        
        let root = tree.Add(value: 10)
        print("Added 10 as root.")
        tree.Add(value: 1, to: root)
        
        let two = tree.Add(value: 2, to: root)
        
        tree.Add(value: 3, to: root)
        tree.Add(value: 4, to: root)
        tree.Add(value: 5, to: root)
        print("Added 1, 2, 3, 4, 5 as children of 10.")
        
        tree.Add(value: 20, to: two)
        tree.Add(value: 21, to: two)
        tree.Add(value: 22, to: two)
        tree.Add(value: 23, to: two)
        tree.Add(value: 24, to: two)
        print("Added 20, 21, 22, 23, 24 as children of 2.")
        
        print("Removing 21 from the tree...")
        
        tree.Remove(item: 21)
        
        print("Checking that items are added to tree properly using traversal.")
        
        for (i, ans) in expected.enumerated() {
            for (j, node) in tree.enumerated() {
                
                if i != j { continue }
                
                print("Expected: \(ans.Value) Got: \(node.Value)", terminator: "")
                
                if ans.Value == node.Value {
                    print("  PASSED")
                } else {
                    result = false
                    print("  FAILED")
                }
            }
        }
        
        if result {
            print("21 successfully removed from tree.  PASS")
        } else {
            print("21 WAS NOT successfully removed from tree.  FAIL")
        }
        
        return result
    }
    
}
