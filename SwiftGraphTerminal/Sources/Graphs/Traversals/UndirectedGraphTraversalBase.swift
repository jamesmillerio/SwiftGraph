//
//  UndirectedGraphTraversalBase.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedGraphTraversalBase<T> : IteratorProtocol where T : Comparable, T : Hashable {
    public func next() -> UndirectedVertex<T>? {
        return nil
    }
}
