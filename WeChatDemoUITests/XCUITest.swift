//
//  XCUITest.swift
//  WeChatDemoTests
//
//  Created by djing on 2020/7/31.
//  Copyright © 2020 djing. All rights reserved.
//
import XCTest
import Foundation

class UItest: XCTestCase{
    let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    override func tearDown() {
        
    }
    func testScroll(){
        XCTAssert(app.staticTexts["Derek Jing"].isHittable)
        app.swipeUp()
    }
    
}
