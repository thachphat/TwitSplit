//
//  LoginLoginViewModelTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class LoginViewModelTests: XCTestCase {

    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        self.viewModel = LoginViewModel()
    }

    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }

}