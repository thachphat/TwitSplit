//
//  TwitterProvider.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/15/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import RxSwift
import TwitterKit

class TwitterProvider: NSObject {
    
    func login() -> Observable<TWTRSession> {
        return PublishSubject.create({ (observer) -> Disposable in
            Twitter.sharedInstance().logIn(completion: { (session, error) in
                if let error = error {
                    observer.onError(error)
                } else if let session = session {
                    observer.onNext(session)
                    observer.onCompleted()
                }
            })
            return Disposables.create()
        })
    }
    
    func log0ut() -> Observable<Bool> {
        return PublishSubject.create({ (observer) -> Disposable in
            let store = Twitter.sharedInstance().sessionStore
            if let userID = store.session()?.userID {
                store.logOutUserID(userID)
            }
            observer.onNext(true)
            
            return Disposables.create()
        })
    }
    
}
