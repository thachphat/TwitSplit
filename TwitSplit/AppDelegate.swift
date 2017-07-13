//
//  AppDelegate.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/14/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Twitter.sharedInstance().start(withConsumerKey: TwitterKey.consumerKey.rawValue, consumerSecret: TwitterKey.consumerSecret.rawValue)
        
        return true
    }

}

