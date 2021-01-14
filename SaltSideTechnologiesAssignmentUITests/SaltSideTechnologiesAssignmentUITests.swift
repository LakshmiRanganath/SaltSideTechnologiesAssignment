//
//  SaltSideTechnologiesAssignmentUITests.swift
//  SaltSideTechnologiesAssignmentUITests
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import XCTest

class SaltSideTechnologiesAssignmentUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableInteraction() {
        app.launch()
     
        // Assert that we are displaying the tableview
        let saltsideTableView = app.tables["table--saltsideTableView"]
        
        XCTAssertTrue(saltsideTableView.exists, "The saltside tableview does not exist")
        
        let errorDisplayLabel = app.staticTexts["label--errorDisplayLabel"]
        
        XCTAssertFalse(errorDisplayLabel.exists, "Error display label is not hidden")
        
        let tryAgainButton = app.buttons["button--tryAgainButton"]
        
        XCTAssertFalse(tryAgainButton.exists, "TryAgain button is not hidden")
        // Get an array of cells
        let tableCells = saltsideTableView.cells.matching(identifier: "saltsideTableViewCell")
        //First cell
        let cell = tableCells.element(boundBy: 0)
        
        //Checking for all cell elements
        let cellTitleLabel = cell.staticTexts["label--cellTitleLabel"]
        
        XCTAssertTrue(cellTitleLabel.exists, "The cell title label does not exist")
        
        let cellDescriptionLabel = cell.staticTexts["label--cellDescriptionLabel"]
        
        XCTAssertTrue(cellDescriptionLabel.exists, "The cell description label does not exist")
        
        //Navigate to detail view by tapping cell
        cell.tap()
        
        
        //Check for all elements in detail view
        let saltsideDetailImageView = app.images["image--saltsideImageView"]
        
        XCTAssertTrue(saltsideDetailImageView.exists, "The saltside detail image does not exist")
        
        let saltsideDetailTitleLabel = app.staticTexts["label--saltsideTitleLabel"]
        
        XCTAssertTrue(saltsideDetailTitleLabel.exists, "The saltside detail title label does not exist")
        
        let saltsideDescriptionLabel = app.staticTexts["label--saltsideDescriptionLabel"]
        
        XCTAssertTrue(saltsideDescriptionLabel.exists, "The saltside detail description label does not exist")
        
        //Back button
        app.navigationBars.buttons.element(boundBy: 0).tap()
  
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
