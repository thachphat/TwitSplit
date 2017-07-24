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
    
    func splitMessage(message: String) -> [String] {
        do {
            return try String.splitMessage(message: message)
        } catch {
            XCTFail("test failed")
        }
        return [""]
    }
    
    func testSplitMessageLessThanOrEqual50Characters() {
        let oneCharacterMessage = "a"
        XCTAssert(splitMessage(message: oneCharacterMessage) == [oneCharacterMessage], "Split message with one character")
        
        let _50CharactersMessage = String(repeating: "a", count: 50)
        XCTAssert(splitMessage(message: _50CharactersMessage) == [_50CharactersMessage], "Split message with 50 characters")
    }
    
    func testSplitMessageHasWordLongerThan50Characters() {
        let _51CharactersMessage = String(repeating: "a", count: 51)
        let wordLongerThan50CharactersExpectation = expectation(description: "Passed test cannot split words longer than 50 characters")
        do {
            let _ = try String.splitMessage(message: _51CharactersMessage)
        } catch {
            wordLongerThan50CharactersExpectation.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testSplitMessageGreaterThan50Characters() {
        var message = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        var splitMessages = [
            "1/2 I can't believe Tweeter now supports chunking",
            "2/2 my messages, so I don't have to do it myself."
        ]
        XCTAssert(splitMessage(message: message) == splitMessages, "Split message with white space at 46th chracter")
        
        message = "This is a test which whitespace character fell at 47th character."
        splitMessages = [
            "1/2 This is a test which whitespace character fell",
            "2/2 at 47th character."
        ]
        XCTAssert(splitMessage(message: message) == splitMessages, "Split message with white space at 47th chracter")

        message = "This is a test for longer character which is longer than 50 characters."
        splitMessages = [
            "1/2 This is a test for longer character which is",
            "2/2 longer than 50 characters."
        ]
        XCTAssert(splitMessage(message: message) == splitMessages, "Split message with characters at position 46th and 47th")
    }
    
}
