//
//  DirectedGraphTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedGraphTesting : TestSuite {
    
    public var SuiteName: String { get { return "Directed Graph Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Graph Creation, Insertion, and Traversal"] = creationTest
        self.Tests["Removal"] = searchAndremoval
        
    }
    
    func creationTest() -> Bool {
        
        print("This test makes sure the graph nodes are added to the graph correctly and that a traversal returns them in the expected order.")
        print("--------------------------------")
        
        let graph = DirectedGraph<String>()
        var result = true
        
        graph.TraversalType = Traversal.BFS
        
        let A = graph.Add(value: "A")
        let F = graph.Add(value: "F")
        
        let B = A.Add(value: "B")
        let D = A.Add(value: "D")
        let E = A.Add(value: "E")
        let C = B.Add(value: "C")
        
        F.Add(vertex: E)
        B.Add(vertex: D)
        D.Add(vertex: A)
        D.Add(vertex: E)
        D.Add(vertex: C)
        
        let expected : [DirectedVertex<String>] = [
            DirectedVertex<String>(value: "A"),
            DirectedVertex<String>(value: "B"),
            DirectedVertex<String>(value: "D"),
            DirectedVertex<String>(value: "E"),
            DirectedVertex<String>(value: "C"),
            DirectedVertex<String>(value: "F")]
        
        for (i, ans) in expected.enumerated() {
            for (j, node) in graph.enumerated() {
                
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
        
        print("This test makes sure the graph nodes are removed from the graph correctly.")
        print("--------------------------------")
        
        let graph = DirectedGraph<String>()
        var result = true
        
        graph.TraversalType = Traversal.BFS
        
        let A = graph.Add(value: "A")
        let F = graph.Add(value: "F")
        
        let B = A.Add(value: "B")
        let D = A.Add(value: "D")
        let E = A.Add(value: "E")
        let C = B.Add(value: "C")
        
        F.Add(vertex: E)
        B.Add(vertex: D)
        D.Add(vertex: A)
        D.Add(vertex: E)
        D.Add(vertex: C)
        
        print("Graph traversal before removing B: ", terminator: "")
        graph.Print()
        print("Removing node B")
        
        graph.Remove(value: "B")
        
        print("Graph traversal after removing B: ", terminator: "")
        graph.Print()
        
        let expected : [DirectedVertex<String>] = [
            DirectedVertex<String>(value: "A"),
            DirectedVertex<String>(value: "D"),
            DirectedVertex<String>(value: "E"),
            DirectedVertex<String>(value: "C"),
            DirectedVertex<String>(value: "F")]
        
        for (i, ans) in expected.enumerated() {
            for (j, node) in graph.enumerated() {
                
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
