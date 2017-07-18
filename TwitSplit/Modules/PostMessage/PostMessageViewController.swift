//
//  PostMessagePostMessageViewController.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import RealmSwift

let MySenderId = "Phat"

class PostMessageViewController: JSQMessagesViewController {
    
    let realm = try! Realm()

    var messages = [JSQMessage]()
    
    let incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    let outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(with: UIColor.lightGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages = realm.objects(Message.self).map({ JSQMessage(senderId: $0.senderId, displayName: $0.displayName, text: $0.text) })
        
        self.inputToolbar?.contentView?.leftBarButtonItem = nil
        
        collectionView?.collectionViewLayout.incomingAvatarViewSize = .zero
        collectionView?.collectionViewLayout.outgoingAvatarViewSize = .zero
        
        collectionView?.collectionViewLayout.springinessEnabled = false
        
        senderId = MySenderId
        senderDisplayName = senderId
        automaticallyScrollsToMostRecentMessage = true
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let splittedMessages = String.splitMessage(message: text)
        for message in splittedMessages {
            let myMessage = Message()
            myMessage.senderId = senderId
            myMessage.displayName = senderId
            myMessage.text = message
            try! realm.write {
                realm.add(myMessage)
            }
            self.messages.append(JSQMessage(senderId: senderId, displayName: senderId, text: message)!)
        }
        self.finishSendingMessage(animated: true)
        self.collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 0
    }
    
}
