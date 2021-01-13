//
//  SaltsideLRUCacheTests.swift
//  SaltSideTechnologiesAssignmentTests
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import XCTest

@testable import SaltSideTechnologiesAssignment

class SaltsideLRUCacheTests: XCTestCase {
    
    func testLRUFunctionality(){
        let cacheToTestSize = 5
        let cacheToTest = SaltsideLRUCache<String,Int>(cacheToTestSize)
        XCTAssertEqual(cacheToTest.capacity, cacheToTestSize)
        XCTAssertFalse(cacheToTest.isValid(key: "One"))
        cacheToTest.put("One", 1)
        cacheToTest.put("Two", 2)
        cacheToTest.put("Three", 3)
        cacheToTest.put("Four", 4)
        cacheToTest.put("Five", 5)
        cacheToTest.put("Six", 6)
        XCTAssertNotNil(cacheToTest.get("Two"))
        cacheToTest.put("Seven", 7)
        cacheToTest.put("Eight", 8)
        XCTAssertTrue(cacheToTest.isValid(key: "Two"))
        XCTAssertFalse(cacheToTest.isValid(key: "Three"))
        XCTAssertFalse(cacheToTest.isValid(key: "Four"))
    }
    
}
