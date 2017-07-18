//
//  Message.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/18/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import RealmSwift
import JSQMessagesViewController

class Message: Object {
    dynamic var senderId = ""
    dynamic var displayName = ""
    dynamic var text = ""
}
