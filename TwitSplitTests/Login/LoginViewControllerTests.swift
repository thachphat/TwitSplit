//
//  LoginLoginViewControllerTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class LoginViewControllerTests: XCTestCase {

    var controller: LoginViewController!

    override func setUp() {
        super.setUp()
        self.controller = LoginViewController()
    }

    override func tearDown() {
        self.controller = nil
        super.tearDown()
    }

}