//
//  String.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/17/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import Foundation

enum SplitMessageError: Error {
    case cannotSplitMessage
}

extension String {
    
    static let messageMaxLength = 50
    
    static func splitMessage(message: String) throws -> [String] {
        if message.characters.count <= messageMaxLength {
            return [message]
        }
        
        let words = message.components(separatedBy: " ")
        if words.first(where: { $0.characters.count > messageMaxLength }) != nil {
            throw SplitMessageError.cannotSplitMessage
        }
        
        let maxPartsDigitCount = findMaxPartsDigitCount(message: message, length: messageMaxLength)
        let result = splittedString(string: message, length: messageMaxLength, maxPartsDigitCount: maxPartsDigitCount)
        
        if let check = result.first(where: { $0.characters.count > messageMaxLength }) {
            print("Check", check)
            fatalError("There is at least one part longer than \(messageMaxLength) characters")
        }
        
        return result
    }
    
    fileprivate static func findMaxPartsDigitCount(message: String, length: Int) -> Int {
        var count = 0
        var maxCharacters = 0
        repeat {
            let A = length - 2 * (count + 2)
            let B = Int(String(repeating: "1", count: count + 1))!
            var C = 0
            if count > 0 {
                for i in 1...count {
                    C = C * 10 + i
                }
            }
            
            maxCharacters = 9 * (A * B + C)
            count += 1
        } while maxCharacters < message.characters.count
        return count
    }
    
    fileprivate static func splittedString(string: String, length: Int, maxPartsDigitCount: Int) -> [String] {
        var result = [String]()
        
        var currentMessage = ""
        for word in string.components(separatedBy: " ") {
            let currentIndexCharactersCount = String(result.count + 1).characters.count + maxPartsDigitCount + 2 // 1 is for " ", 1 is for "/" => + 2
            let currentMessageCharactersCountIfAppendThisWord = currentMessage.characters.count + currentIndexCharactersCount + word.characters.count + 1 // 1 is for " "
            if currentMessage.characters.count == 0 {
                currentMessage = word
            } else if currentMessageCharactersCountIfAppendThisWord <= length {
                currentMessage += " \(word)"
            } else {
                result.append(currentMessage)
                currentMessage = word
            }
        }
        result.append(currentMessage)
        
        result = result.enumerated().map({ "\($0 + 1)/\(result.count) \($1)".trimmingCharacters(in: .whitespacesAndNewlines) })
        
        if result.first(where: { $0.characters.count > length }) != nil {
            // max Parts Digit Count may vary +1 because cannot split word without white space
            return splittedString(string: string, length: length, maxPartsDigitCount: maxPartsDigitCount + 1)
        } else {
            return result
        }
    }
}
