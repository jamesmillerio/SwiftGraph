//
//  DirectedEdge.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class DirectedEdge<T> where T : Comparable, T : Hashable {
    
    public init(destination: DirectedVertex<T>) {
        self.Destination = destination
    }
    
    public var Destination: DirectedVertex<T>
}
