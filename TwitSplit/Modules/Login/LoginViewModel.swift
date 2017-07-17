//
//  LoginLoginViewModel.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import RxSwift
import RxCocoa
import TwitterKit
import Result

class LoginViewModel: BaseViewModel {
    
    // Input
    var loginTapped = PublishSubject<Void>()
    
    // Output
    let loginFinished: Driver<Result<Void, MyError>>
    
    fileprivate let provider: TwitterProvider
    
    init(provider: TwitterProvider) {
        self.provider = provider
        
        loginFinished = loginTapped
            .flatMap {
                provider.login()
            }
            .map({ (session) -> Result<Void, MyError> in
                return Result.success()
            })
            .asDriver(onErrorJustReturn: Result.failure(MyError.somethingWrong())).debug()
    }
    
}
