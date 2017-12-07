//
//  TestingSuite.swift
//  SwiftGraphTerminal
//
//  Created by James Miller on 12/6/17.
//  Copyright © 2017 jamesmiller.io. All rights reserved.
//

import Foundation

public protocol TestSuite {
    var SuiteName: String { get }
    var Tests: [String : () -> Bool] { get }
}
