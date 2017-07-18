//
//  TwitSplitTests.swift
//  TwitSplitTests
//
//  Created by Phat Chiem on 7/14/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import XCTest
@testable import TwitSplit

class TwitSplitTests: XCTestCase {
    
    func testSplitMessageLessThanOrEqual50Characters() {
        let oneCharacterMessage = "a"
        let splitMessages = String.splitMessage(message: oneCharacterMessage)
        XCTAssert(splitMessages == [oneCharacterMessage], "Split message with one character")
        
        let _49CharactersMessage = Array(repeatElement("a", count: 49)).joined()
        XCTAssert(String.splitMessage(message: _49CharactersMessage) == [_49CharactersMessage], "Split message with 49 characters")
        
        let _50CharactersMessage = Array(repeatElement("a", count: 50)).joined()
        XCTAssert(String.splitMessage(message: _50CharactersMessage) == [_50CharactersMessage], "Split message with 50 characters")
    }
    
}
