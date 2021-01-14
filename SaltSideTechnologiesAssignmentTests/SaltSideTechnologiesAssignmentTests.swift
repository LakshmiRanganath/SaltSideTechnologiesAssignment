//
//  SaltSideTechnologiesAssignmentTests.swift
//  SaltSideTechnologiesAssignmentTests
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import XCTest
@testable import SaltSideTechnologiesAssignment

class SaltSideTechnologiesAssignmentTests: XCTestCase {
    
    var ssMainVCToTest : ViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ssMainVCToTest = storyboard.instantiateViewController(identifier: "SaltSideTableViewController") as? ViewController
        let _ = ssMainVCToTest.view
        ssMainVCToTest.viewDidLoad()
        
        ssMainVCToTest.saltSideListViewModel = SaltsideListViewModel()
        
        ssMainVCToTest.saltSideListViewModel.saltsideList =
            [SaltSideDataModel(image:"http://dummyimage.com/715x350/105B19/907ECC",
                description:"sterilizer span ticks continuity hubs procurement vision eggs backups cries gap iron conferences torpedo government catchers restaurant destroyers attribute counsel echo overcurrent classes trip environments forecastle giants conspiracies suppression things rope plans bow blots rescuers incline",
                title:"terminations map autos sons utilizations"),
             SaltSideDataModel(image:"http://dummyimage.com/609x750/0D2637/BCE8DA",
                description:"alarm hull wishes flesh surrender others street cliffs chain milestone audit agreement deployment",
                title:"zone initial"),
             SaltSideDataModel(image:"http://dummyimage.com/291x515/D44707/BB4AD9",
                description:"explanation cable control electricians thousand capitals classification conn preserver thirds quartermaster puffs countermeasure armful need discretion similarity fists rust mouths attempts giants dives parameters admirals destroyers alternatives exit paints cab thirteen bolts breaches allowances certificate trails linkage launch contacts moss salts elbows tomorrows",
                title:"organs ropes"),
             SaltSideDataModel(image:"http://dummyimage.com/341x220/960790/1188C2",
                description:"cavities launch officers lasers pound meridian accuracy",
                title:"clerk minerals boxcars ornament official"),
             SaltSideDataModel(image:"http://dummyimage.com/219x363/8257D4/3E0A16",
                description:"restraints sod detention alternation pits instance spindles screwdrivers smile worksheet amusements stub jams breezes bush engine wash official talker shaft states",
                title:"voice chest insertion rest daytime tons"),
             SaltSideDataModel(image:"http://dummyimage.com/383x512/CA7043/0405C8",
                description:"eye calorie blot airfields certificate conjunction dyes mixture delegate searches junctions age explanation guards cots disks defeat carloads adjective buoy dusts swell customers barrels",
                title:"talker bean way ride")
            ]
//        ssMainVCToTest.saltsideTableView.dataSource = ssMainVCToTest
//        ssMainVCToTest.saltsideTableView.delegate = ssMainVCToTest
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHasATableView() {
        XCTAssertNotNil(ssMainVCToTest.saltsideTableView)
    }

    func testTableViewHasDataSource() {
        XCTAssertNotNil(ssMainVCToTest.saltsideTableView.dataSource)
    }
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(ssMainVCToTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(ssMainVCToTest.responds(to: #selector(ssMainVCToTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(ssMainVCToTest.responds(to: #selector(ssMainVCToTest.tableView(_:cellForRowAt:))))
    }
    func testTableViewHasDelegate() {
        XCTAssertNotNil(ssMainVCToTest.saltsideTableView.delegate)
    }

    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(ssMainVCToTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(ssMainVCToTest.responds(to: #selector(ssMainVCToTest.tableView(_:didSelectRowAt:))))
    }
    func testTableViewCellHasReuseIdentifier() {
        let cell = ssMainVCToTest.saltsideTableView.dequeueReusableCell(withIdentifier: "saltsideTableViewCell")
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "saltsideTableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

    func testTableViewCellHasAllElementsInCell(){
        ssMainVCToTest.saltsideTableView.reloadData()
        XCTAssertEqual(ssMainVCToTest.saltsideTableView.numberOfRows(inSection: 0), ssMainVCToTest.saltSideListViewModel.saltsideList.count)
        for index in 0..<ssMainVCToTest.saltSideListViewModel.saltsideList.count{
            let cell = ssMainVCToTest.tableView(ssMainVCToTest.saltsideTableView, cellForRowAt: IndexPath(row: index, section: 0)) as! SaltsideTableViewCell
            XCTAssertNotNil(cell.saltsideTitleLabel)
            XCTAssertNotNil(cell.saltsideDescriptionLabel)
            XCTAssertNotNil(cell.saltsideImageView)
            XCTAssertEqual(cell.saltsideTitleLabel.text, ssMainVCToTest.saltSideListViewModel.saltsideList[index].title)
            XCTAssertEqual(cell.saltsideDescriptionLabel.text, ssMainVCToTest.saltSideListViewModel.saltsideList[index].description)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

