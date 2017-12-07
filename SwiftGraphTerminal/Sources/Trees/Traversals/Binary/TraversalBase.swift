//
//  TraversalBase.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/3/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class TraversalBase<T> : IteratorProtocol where T : Comparable {
    public func next() -> BinaryNode<T>? {
        return nil
    }
}
