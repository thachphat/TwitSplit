//
//  BaseBaseViewModelTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 15/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class BaseViewModelTests: XCTestCase {

    var viewModel: BaseViewModel!

    override func setUp() {
        super.setUp()
        self.viewModel = BaseViewModel()
    }

    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }

}