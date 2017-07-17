//
//  BaseBaseViewControllerTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 15/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class BaseViewControllerTests: XCTestCase {

    var controller: BaseViewController!

    override func setUp() {
        super.setUp()
        self.controller = BaseViewController()
    }

    override func tearDown() {
        self.controller = nil
        super.tearDown()
    }

}