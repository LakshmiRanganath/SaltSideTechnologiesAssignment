//
//  SaltSideListViewModelTests.swift
//  SaltSideTechnologiesAssignmentTests
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import XCTest
@testable import SaltSideTechnologiesAssignment

class SaltSideListViewModelTests: XCTestCase {

    var saltsideListModel = SaltSideDataModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPICallValidity(){
        testValidCallToAPIsHTTPStatusCode200(forURLString: SaltsideConstants.saltsideListUrlString)
    }
    
    func testValidCallToAPIsHTTPStatusCode200(forURLString : String) {
      // given
      let url = URL(string: forURLString)
      let promise = expectation(description: "Status code: 200")

        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
        // then
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        }
        else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
            XCTAssertNil(error)
            XCTAssertEqual(statusCode, 200)
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
      
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

