//
//  FountainTests.swift
//  FountainTests
//
//  Created by Kenneth Parker Ackerson on 12/15/15.
//  Copyright © 2015 Kenneth Ackerson. All rights reserved.
//

import XCTest
import Fountain

final class FountainTests: XCTestCase {
    
    func testMap() {

        let array = ["1", "2"]
        
        func function(string: String) -> Int? {
            return Int(string)
        }
        
        let mapped = array.map(function)
        
        let other = function <^> array
        
        
    }
    
    func testFlatMap() {
        
        let array = ["1", "2"]
        
        func function(string: String) -> [String] {
            return [string]
        }
        
        let flatMapped = array.flatMap(function)
        
        let other = (array >>- function)

        XCTAssert(other == flatMapped)
    }
    
}
