//
//  LongFormTestTests.swift
//  LongFormTestTests
//
//  
//

import XCTest
@testable import LongFormTest

class ShortFormValidationTests: XCTestCase {

    func test_With_Empty_TextField() {

        let validation = SearchValidation()
        let request = SearchRequest(sf: "")

        let result = validation.Validate(searchRequest: request)

        // ASSERT
        XCTAssertEqual(result.error, "Text is empty")
    }
    
    func test_With_Numbers_TextField() {
        let validation = SearchValidation()
        let request = SearchRequest(sf: "Abc1")
        
        let result = validation.Validate(searchRequest: request)
        
        // ASSERT
        XCTAssertEqual(result.error, "Text contains number")
    }
}
