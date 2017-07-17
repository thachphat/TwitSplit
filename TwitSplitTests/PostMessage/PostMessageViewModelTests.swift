//
//  PostMessagePostMessageViewModelTests.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class PostMessageViewModelTests: XCTestCase {

    var viewModel: PostMessageViewModel!

    override func setUp() {
        super.setUp()
        self.viewModel = PostMessageViewModel()
    }

    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }

}