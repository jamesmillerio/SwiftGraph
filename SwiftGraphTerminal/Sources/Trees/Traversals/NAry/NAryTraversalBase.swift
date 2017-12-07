//
//  NAryTraversalBase.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class NAryTraversalBase<T> : IteratorProtocol where T : Comparable {
    public func next() -> NAryNode<T>? {
        return nil
    }
}
