//
//  Queue.swift
//  SwiftGraph
//
//  Created by James Miller on 12/2/17.
//

import Foundation

public class Queue<T> {
    
    private var items: [T] = [T]()
    
    public func IsEmpty() -> Bool {
        return self.items.isEmpty
    }
    
    public func Size() -> Int {
        return self.items.count
    }
    
    public func Enqueue(_ item: T) {
        items.append(item)
    }
    
    public func Dequeue() -> T? {
        
        guard let first = self.items.first else { return nil }
        
        self.items.removeFirst()
        return first
    }
    
}
