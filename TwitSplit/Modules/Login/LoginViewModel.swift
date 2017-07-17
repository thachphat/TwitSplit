//
//  LoginLoginViewModel.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import TwitterKit

enum LoginResult {
    case ok
    case failed(message: String)
}

class LoginViewModel: BaseViewModel {
    
    // Input
    var loginTapped = PublishSubject<Void>()
    
    // Output
    let loginFinished: Driver<LoginResult>
    
    fileprivate let provider: TwitterProvider
    
    init(provider: TwitterProvider) {
        self.provider = provider
        
        loginFinished = loginTapped
            .flatMap {
                provider.login()
            }
            .map({ (session) -> LoginResult in
                return LoginResult.ok
            })
            .asDriver(onErrorJustReturn: LoginResult.failed(message: "Something went wrong")).debug()
    }
    
}
