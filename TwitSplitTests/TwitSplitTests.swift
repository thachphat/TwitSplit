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
    
    func testSplitMessageGreaterThan50CharactersAndLessThanOrEqual9Splits() {
        let _51CharactersMessage = String(repeating: "a", count: 51)
        let firstSplitMessage = "1/2 " + String(repeating: "a", count: 46)
        let secondSplitMessage = "2/2 " + String(repeating: "a", count: 5)
        XCTAssert(splitMessage(message: _51CharactersMessage) == [firstSplitMessage, secondSplitMessage], "Split message with 51 characters")
        
        let _9SplitsMessage = String(repeating: "a", count: 46 * 9)
        var _9Splits = Array(repeatElement(String(repeating: "a", count: 46), count: 9))
        _9Splits = _9Splits.enumerated().map { (index, element) -> String in
            return "\(index + 1)/\(_9Splits.count) " + element
        }
        XCTAssert(splitMessage(message: _9SplitsMessage) == _9Splits, "Split message with 9 splits, 46 characters each")
    }
    
    func testSplitMessageGreaterThan9Splits() {
        let _10SplitsMessage = String(repeating: "a", count: 46 * 9 + 1)
        var _10Splits = Array(repeatElement(String(repeating: "a", count: 45), count: 9))
        _10Splits.append(String(repeating: "a", count: 10))
        _10Splits = _10Splits.enumerated().map { (index, element) -> String in
            return "\(index + 1)/\(_10Splits.count) " + element
        }
        XCTAssert(splitMessage(message: _10SplitsMessage) == _10Splits, "Split message with 10 splits, 45 characters each and last one is 10 characters")
        
        let _99SplitsMessage = String(repeating: "a", count: 45 * 9 + 44 * 90)
        var _99Splits = Array(repeatElement(String(repeating: "a", count: 45), count: 9))
        _99Splits += Array(repeatElement(String(repeating: "a", count: 44), count: 90))
        _99Splits = _99Splits.enumerated().map { (index, element) -> String in
            return "\(index + 1)/\(_99Splits.count) " + element
        }
        XCTAssert(splitMessage(message: _99SplitsMessage) == _99Splits, "Split message with 99 splits")
        
        let _102SplitsMessage = String(repeating: "a", count: 45 * 9 + 44 * 90 + 1)
        var _102Splits = Array(repeatElement(String(repeating: "a", count: 44), count: 9))
        _102Splits += Array(repeatElement(String(repeating: "a", count: 43), count: 90))
        _102Splits += Array(repeatElement(String(repeating: "a", count: 42), count: 2))
        _102Splits.append(String(repeating: "a", count: 16))
        _102Splits = _102Splits.enumerated().map { (index, element) -> String in
            return "\(index + 1)/\(_102Splits.count) " + element
        }
        XCTAssert(splitMessage(message: _102SplitsMessage) == _102Splits, "Split message with > 100 splits")
    }
    
}
