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
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        Twitter.sharedInstance().start(withConsumerKey: TwitterKey.consumerKey.rawValue, consumerSecret: TwitterKey.consumerSecret.rawValue)
        
        showRootView()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return Twitter.sharedInstance().application(app, open: url, options: options)
    }
    
    func showRootView() {
        let storyboard = UIStoryboard.main
        if Twitter.sharedInstance().sessionStore.session() == nil {
            window?.rootViewController = storyboard.viewController(type: LoginViewController.self)
        } else {
            window?.rootViewController = storyboard.viewController(type: PostMessageViewController.self)
        }
    }

}

