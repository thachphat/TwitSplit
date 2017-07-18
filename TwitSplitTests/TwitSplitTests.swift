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
        
        let _50CharactersMessage = Array(repeatElement("a", count: 50)).joined()
        XCTAssert(String.splitMessage(message: _50CharactersMessage) == [_50CharactersMessage], "Split message with 50 characters")
    }
    
    func testSplitMessageGreaterThan50CharactersAndLessThanOrEqual9Splits() {
        let _51CharactersMessage = Array(repeatElement("a", count: 51)).joined()
        let firstSplitMessage = "1/2 " + Array(repeatElement("a", count: 46)).joined()
        let secondSplitMessage = "2/2 a"
        XCTAssert(String.splitMessage(message: _51CharactersMessage) == [firstSplitMessage, secondSplitMessage], "Split message with 51 characters")
        
        let _9SplitsMessage = Array(repeatElement("a", count: 46 * 9)).joined()
        var _9Splits = Array(repeatElement("/9 " + Array(repeatElement("a", count: 46)).joined(), count: 9))
        _9Splits = _9Splits.enumerated().map { (index, element) -> String in
            return "\(index + 1)" + element
        }
        XCTAssert(String.splitMessage(message: _9SplitsMessage) == _9Splits, "Split message with 9 splits, 46 characters each")
    }
    
}
