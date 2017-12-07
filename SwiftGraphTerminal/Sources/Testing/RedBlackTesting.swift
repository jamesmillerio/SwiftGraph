//
//  RedBlackTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class RedBlackTesting : TestSuite {
    
    public var SuiteName: String { get { return "Red-Black Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Tree Creation, Insertion, and Auto-Balancing"] = creationAndSelfBalancingTest
        self.Tests["Removal"] = searchAndremoval
        
    }
    
    func creationAndSelfBalancingTest() -> Bool {

        let tree = RedBlackTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1, color: Color.Black),
            BinaryNode<Int>(value: 6, color: Color.Red),
            BinaryNode<Int>(value: 8, color: Color.Red),
            BinaryNode<Int>(value: 11, color:Color.Black),
            BinaryNode<Int>(value: 13, color: Color.Black),
            BinaryNode<Int>(value: 15, color: Color.Black),
            BinaryNode<Int>(value: 17, color: Color.Red),
            BinaryNode<Int>(value: 22, color: Color.Red),
            BinaryNode<Int>(value: 25, color: Color.Black),
            BinaryNode<Int>(value: 27, color: Color.Red)]
        
        print("This test adds values to the tree and balances as they are added. It is a test of not only creation and insertion, but the auto-balancing aspects of Red-Black Trees.")
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
                
                print("Expected: \(ans.Value) \(ans.NodeColor) Got: \(node.Value) \(node.NodeColor)", terminator: "")
                
                if ans.Value == node.Value && ans.NodeColor == node.NodeColor {
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
        
        let tree = RedBlackTree<Int>()
        let values = [13, 8, 17, 1, 11, 15, 25, 6, 22, 27]
        
        let expected : [BinaryNode<Int>] = [
            BinaryNode<Int>(value: 1, color: Color.Black),
            BinaryNode<Int>(value: 6, color: Color.Red),
            BinaryNode<Int>(value: 8, color: Color.Red),
            BinaryNode<Int>(value: 11, color:Color.Black),
            BinaryNode<Int>(value: 15, color: Color.Black),
            BinaryNode<Int>(value: 17, color: Color.Red),
            BinaryNode<Int>(value: 22, color: Color.Red),
            BinaryNode<Int>(value: 25, color: Color.Black),
            BinaryNode<Int>(value: 27, color: Color.Red)]
        
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
