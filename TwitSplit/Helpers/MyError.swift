//
//  MyError.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/17/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import Foundation

public enum MyError: Swift.Error {
    case somethingWrong()
    /// Indicates a response failed due to an underlying `Error`.
    case underlying(Swift.Error)
}

// MARK: - Error Descriptions

extension MyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .somethingWrong:
            return "Something went wrong"
        case .underlying(let error):
            return error.localizedDescription
        }
    }
}
