//
//  WeChatDemoTests.swift
//  WeChatDemoTests
//
//  Created by djing on 2020/7/24.
//  Copyright © 2020 djing. All rights reserved.
//

import XCTest
@testable import WeChatDemo

class WeChatDemoTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFirstTable() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let SetUI = ViewController()
        let count = try XCTUnwrap(SetUI.group[1].person.count)

        XCTAssertEqual(count, 11)
    }

}
