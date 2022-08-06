//
//  Mock.swift
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

/// Mocks should conform to this protocol in order to setup factual actions and verify expectations
public protocol Mock {

    associatedtype Action: Equatable
    
    /// Action manager of mock object
    /// Instantiate new `MockActions` in every unit to define new expectations
    var actions: MockActions<Action> { get }
    
    /// Register factual actions inside mock objects.
    /// Do not call this method outside the mock object.
    /// Factual actions should only be registered inside mocks.
    ///
    /// - Parameter action: action which is excpected to be happened
    func register(_ action: Action)
    
    /// At the end of unit, call to verify the expectations.
    ///
    /// - Parameters:
    ///   - file: File name of test
    ///   - line: Line number of test
    func verify(file: StaticString, line: UInt)
}

// Optional Methods
extension Mock {
    
    public func register(_ action: Action) {
        actions.register(action)
    }
    
    public func verify(file: StaticString = #file, line: UInt = #line) {
        actions.verify(file: file, line: line)
    }
}
