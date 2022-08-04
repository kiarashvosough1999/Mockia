//
//  MockActions.swift
//  Mockia
//
//  Created by Kiarash Vosough on 8/4/22.
//
//  Copyright 2022 KiarashVosough and other contributors
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation
import XCTest

/// Action manager of mock objects
public final class MockActions<Action> where Action: Equatable {
    
    /// Actions which should be specified on the units and mocks are expected to fulfill them
    private var expected: [Action]
    
    /// Actions which are registred inside mocks to respond to the expectation
    private var factual: [Action]
    
    /// A closure which calls when the verify method is called to ignore the factual which are not needed in specific unit.
    private var shouldIgnoreAction: ((Action) -> Bool)
    
    /// Use the this initializer to specify the expectatios and ignoring factuals
    /// - Parameters:
    ///   - expected: Actions which should be specified on the units and mocks are expected to fulfill them
    ///   - shouldIgnoreAction: A closure which calls when the verify method is called to ignore the factual which are not needed in specific unit.
    public init(expected: [Action], shouldIgnoreAction: @escaping ((Action) -> Bool) = { _ in false }) {
        self.expected = expected
        self.shouldIgnoreAction = shouldIgnoreAction
        self.factual = []
    }
    
    /// Register a factual action
    ///
    /// - Parameter action: A factual action
    internal func register(_ action: Action) {
        factual.append(action)
    }
    
    /// Verify that expectation and factual actions are equal or not,
    /// If all the expectations are not fulfilled, A XCTFail arises.
    ///
    /// - Parameters:
    ///   - file: File name of test
    ///   - line: Line number of test
    internal func verify(file: StaticString, line: UInt) {
        let nonIgnoredfactual = factual.filter { shouldIgnoreAction($0) == false }
        if nonIgnoredfactual == expected { return }
        let factualNames = nonIgnoredfactual.map { "." + String(describing: $0) }
        let expectedNames = expected.map { "." + String(describing: $0) }
        XCTFail("\(name)\n\nExpected:\n\n\(expectedNames)\n\nReceived:\n\n\(factualNames)", file: file, line: line)
    }
    
    private var name: String {
        let fullName = String(describing: self)
        let nameComponents = fullName.components(separatedBy: ".")
        return nameComponents.dropLast().last ?? fullName
    }
}
