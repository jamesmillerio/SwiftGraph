//
//  main.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/3/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

var suites: [TestSuite] = [TestSuite]()

suites.append(NAryTesting())
suites.append(AVLTesting())
suites.append(RedBlackTesting())
suites.append(BSTTesting())
suites.append(DirectedGraphTesting())
suites.append(UndirectedGraphTesting())

for suite in suites {
    
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    print("\(suite.SuiteName)")
    
    for test in suite.Tests {
        print("Testing \(test.key)...")
        print("---------------------------------")
        let passed = test.value() ? "PASS" : "FAIL"
        
        print("RESULT: \(passed)")
        print("---------------------------------")
    }
    
}
