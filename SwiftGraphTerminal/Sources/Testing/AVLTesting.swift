//
//  AVLTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class AVLTesting : TestSuite {
    
    public var SuiteName: String { get { return "AVL Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Tree Creation and Insertion"] = creationAndSelfBalancingTest
        self.Tests["Removal"] = searchAndremoval
        self.Tests["Rebalancing after Removal"] = removalRebalancing
        
    }
    
    func creationAndSelfBalancingTest() -> Bool {
        
        let tree = AVLTree<Int>()
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
        
        print("This test creates and adds values to the AVL Tree. It also balances as it adds items. The check at the end checks the order which also checks to make sure the balancing worked.")
        print("--------------------------------")
        print("Adding the following values to the tree: ", terminator: "")
        
        for value in values {
            print("\(value) ", terminator: "")
            tree.Add(value: value)
        }
        
        var result = true
        
        print("")
        
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
        
        let tree = AVLTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        var expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 6),
            BinaryNode<Int>(value: 8),
            BinaryNode<Int>(value: 11),
            BinaryNode<Int>(value: 15),
            BinaryNode<Int>(value: 17),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 25),
            BinaryNode<Int>(value: 27)]
        
        print("This test makes sure the removed nodes are actually removed. It is also a test of balancing and node rotations.")
        print("--------------------------------")
        print("Adding the following values to the tree: ", terminator: "")
        
        for value in values {
            print("\(value) ", terminator: "")
            tree.Add(value: value)
        }
        
        print("")
        
        var remove = 17
        
        if let exists = tree.Search(value: remove) {
            print("Node verified to be in the tree.")
        } else {
            print("Node NOT in the tree!")
            return false
        }
        
        print("Removing node \(remove)...")
        
        tree.Remove(item: remove)
        
        let result = tree.Search(value: remove) == nil
        
        if result {
            print("\(remove) does not exist in tree.")
        } else {
            print("\(remove) was NOT removed successfully!")
        }
        
        return result
    }
    
    func removalRebalancing() -> Bool {
        
        let tree = AVLTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1),
            BinaryNode<Int>(value: 6),
            BinaryNode<Int>(value: 8),
            BinaryNode<Int>(value: 11),
            BinaryNode<Int>(value: 13),
            BinaryNode<Int>(value: 15),
            BinaryNode<Int>(value: 22),
            BinaryNode<Int>(value: 25),
            BinaryNode<Int>(value: 27)]
        
        print("This test makes sure the removed nodes are actually removed. It is also a test of balancing and node rotations.")
        print("--------------------------------")
        print("Adding the following values to the tree: ", terminator: "")
        
        for value in values {
            print("\(value) ", terminator: "")
            tree.Add(value: value)
        }
        
        print("")
        
        let remove = 17
        
        print("Removing node \(remove)...")
        
        tree.Remove(item: remove)
        
        if tree.Search(value: remove) != nil {
            print("\(remove) was NOT removed successfully!")
            return false
        } else {
            print("\(remove) does not exist in tree.")
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
}
