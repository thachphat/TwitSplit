//
//  PostMessagePostMessageViewControllerTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class PostMessageViewControllerTests: XCTestCase {

    var controller: PostMessageViewController!

    override func setUp() {
        super.setUp()
        self.controller = PostMessageViewController()
    }

    override func tearDown() {
        self.controller = nil
        super.tearDown()
    }

}