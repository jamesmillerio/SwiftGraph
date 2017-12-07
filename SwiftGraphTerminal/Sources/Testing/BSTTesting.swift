//
//  BSTTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class BSTTesting : TestSuite {
    
    public var SuiteName: String { get { return "BST Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Tree Creation and Insertion"] = creationAndSelfBalancingTest
        self.Tests["Removal"] = searchAndremoval
        
    }
    
    func creationAndSelfBalancingTest() -> Bool {
        
        let tree = BinaryTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 6),
            BinaryNode<Int>(value: 8),
            BinaryNode<Int>(value: 11),
            BinaryNode<Int>(value: 13),
            BinaryNode<Int>(value: 15),
            BinaryNode<Int>(value: 17),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 25),
            BinaryNode<Int>(value: 27)]
        
        print("This test creates and adds values to the BST.")
        print("--------------------------------")
        print("Adding the following values to the tree: ", terminator: "")
        
        for value in values {
            print("\(value) ", terminator: "")
            tree.Add(value: value)
        }
        
        var result = true
        
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
        
        let tree = BinaryTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 6),
            BinaryNode<Int>(value: 8),
            BinaryNode<Int>(value: 11),
            BinaryNode<Int>(value: 15),
            BinaryNode<Int>(value: 17),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 25),
            BinaryNode<Int>(value: 27)]
        
        print("This test makes sure the removed nodes are actually removed..")
        print("--------------------------------")
        print("Adding the following values to the tree: ", terminator: "")
        
        for value in values {
            print("\(value) ", terminator: "")
            tree.Add(value: value)
        }
        
        print("")
        
        if let exists = tree.Search(value: 13) {
            print("Node verified to be in the tree.")
        } else {
            print("Node NOT in the tree!")
            return false
        }
        
        print("Removing node 13...")
        
        tree.Remove(item: 13)
        
        let result = tree.Search(value: 13) == nil
        
        if result {
            print("13 does not exist in tree.")
        } else {
            print("13 was NOT removed successfully!")
        }
        
        return result
    }
    
}
