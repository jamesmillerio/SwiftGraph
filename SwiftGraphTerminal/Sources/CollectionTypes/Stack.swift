//
//  Stack.swift
//  SwiftGraph
//
//  Created by James Miller on 12/2/17.
//

import Foundation

public class Stack<T>  {
    
    private var items: [T] = [T]()
    
    public func IsEmpty() -> Bool {
        return self.items.isEmpty
    }
    
    public func Size() -> Int {
        return self.items.count
    }
    
    public func Push(_ item: T) {
        items.append(item)
    }
    
    public func Pop() -> T? {
        
        guard let last = self.items.last else { return nil }
        
        self.items.removeLast()        
        return last
    }
}
