//
//  SaltsideDetailViewTests.swift
//  SaltSideTechnologiesAssignmentTests
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import XCTest
@testable import SaltSideTechnologiesAssignment

class SaltsideDetailViewTests: XCTestCase {

    var ssDetailVCToTest : SaltsideDetailViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ssDetailVCToTest = storyboard.instantiateViewController(identifier: "SaltSideDetailViewController") as? SaltsideDetailViewController
        let _ = ssDetailVCToTest.view
        
        ssDetailVCToTest.saltsideDetailViewModel = SaltsideDetailViewModel()
        
        ssDetailVCToTest.saltsideDetailViewModel.detailModel =
            SaltSideDataModel(image:"http://dummyimage.com/715x350/105B19/907ECC",
                description:"sterilizer span ticks continuity hubs procurement vision eggs backups cries gap iron conferences torpedo government catchers restaurant destroyers attribute counsel echo overcurrent classes trip environments forecastle giants conspiracies suppression things rope plans bow blots rescuers incline",
                title:"terminations map autos sons utilizations")
        ssDetailVCToTest.viewWillAppear(true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasImageView() {
        XCTAssertNotNil(ssDetailVCToTest.saltsideImageView)
    }
    func testHasTitleLabel() {
        XCTAssertNotNil(ssDetailVCToTest.saltsideTitleLabel)
    }
    func testHasDescriptionLabel() {
        XCTAssertNotNil(ssDetailVCToTest.saltsideDescriptionLabel)
        XCTAssertEqual(ssDetailVCToTest.saltsideImageView.imageUrlString,ssDetailVCToTest.saltsideDetailViewModel.detailModel.image)
        XCTAssertEqual(ssDetailVCToTest.saltsideDescriptionLabel.text, ssDetailVCToTest.saltsideDetailViewModel.detailModel.description)
        XCTAssertEqual(ssDetailVCToTest.saltsideTitleLabel.text, ssDetailVCToTest.saltsideDetailViewModel.detailModel.title?.uppercased())
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
