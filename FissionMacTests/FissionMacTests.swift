//
//  FissionMacTests.swift
//  FissionMacTests
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

import XCTest
import FissionMac

final class FissionMacTests: XCTestCase {
    
    func testMap() {
        let array = ["1", "2"]
        
        func function(string: String) -> Int? {
            return Int(string)
        }
        
        let mapped = array.map(function).flatMap { return $0 }
        
        let other = (function <^> array) |> compact
        
        XCTAssert(other == mapped)
    }
    
    func testFlatMap() {
        
        let array = ["1", "2"]
        
        func function(string: String) -> [String] {
            return [string]
        }
        
        let flatMapped = array.flatMap(function)
        
        let other = array >>- function
        
        XCTAssert(other == flatMapped)
    }
    
    func testFunctionApplication() {
        func function(string: String) -> Int {
            return 22
        }
        
        let result = "hello" |> function
        XCTAssert(result == 22)
    }
    
    func testFunctionApplicationTwo() {
        func function(string: String) -> Int {
            return 22
        }
        
        let result = function <| "hello"
        XCTAssert(result == 22)
    }
    
    func testFunctionComposition() {
        func timesThree(amount: Int) -> Int {
            return amount * 3
        }
        
        func count(string: String) -> Int {
            return string.characters.count
        }
        
        let m = count >>> timesThree >>> { return [$0] } >>> { return $0.reduce(0, combine: +) }
        
        XCTAssert(m("hi") == 6)
    }
    
    func testCompact() {
        let array = ["it", Optional<String>.None, "me"]
        let compacted = array |> compact
        XCTAssert(compacted.count == 2)
    }
    
}
