//
//  UndirectedGraphTesting.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedGraphTesting : TestSuite {
    
    public var SuiteName: String { get { return "Undirected Graph Testing" }}
    
    public var Tests: [String : () -> Bool] = [String : () -> Bool]()
    
    public init() {
        
        self.Tests["Graph Creation, Insertion, and Traversal"] = creationTest
        
    }
    
    func creationTest() -> Bool {
        
        print("This test makes sure the graph nodes are added to the graph correctly and that a traversal returns them in the expected order.")
        print("--------------------------------")
        
        let graph = UndirectedGraph<String>()
        var result = true
        
        graph.TraversalType = Traversal.BFS
        
        print("Adding A as a root vertex.")
        let A = graph.Add(value: "A")
        
        print("Adding F as a root vertex.")
        let F = graph.Add(value: "F")
        
        print("Adding B as a neighbor to A.")
        let B = A.Add(value: "B")
        
        print("Adding D as a neighbor to A.")
        let D = A.Add(value: "D")
        
        print("Adding E as a neighbor to A.")
        let E = A.Add(value: "E")
        
        print("Adding C as a neighbor to B.")
        let C = B.Add(value: "C")
        
        print("Adding E as a neighbor to F.")
        print("Adding D as a neighbor to B.")
        print("Adding A as a neighbor to D.")
        print("Adding E as a neighbor to D.")
        print("Adding C as a neighbor to D.")
        
        F.Add(vertex: E)
        B.Add(vertex: D)
        D.Add(vertex: A)
        D.Add(vertex: E)
        D.Add(vertex: C)
        
        let expected : [UndirectedVertex<String>] = [
            UndirectedVertex<String>(value: "A"),
            UndirectedVertex<String>(value: "B"),
            UndirectedVertex<String>(value: "C"),
            UndirectedVertex<String>(value: "D"),
            UndirectedVertex<String>(value: "E"),
            UndirectedVertex<String>(value: "F")]
        
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
