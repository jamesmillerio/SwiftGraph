//
//  UndirectedEdge.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public class UndirectedEdge<T> where T : Comparable, T : Hashable {
    public init(destination: UndirectedVertex<T>, source: UndirectedVertex<T>) {
        self.DestinationVertex = destination
        self.SourceVertex = source
    }
    
    public var DestinationVertex: UndirectedVertex<T>
    public var SourceVertex: UndirectedVertex<T>
}
