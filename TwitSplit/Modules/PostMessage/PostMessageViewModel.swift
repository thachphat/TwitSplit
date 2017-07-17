//
//  PostMessagePostMessageViewModel.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import RxSwift
import RxCocoa
import Result

class PostMessageViewModel: BaseViewModel {
    
    let logOutTapped = PublishSubject<Void>()
    
    let logOutFinished: Driver<Result<Void, MyError>>
    
    init(provider: TwitterProvider) {
        logOutFinished = logOutTapped
            .flatMap({ provider.log0ut() })
            .map({ _ in return Result.success() })
            .asDriver(onErrorJustReturn: Result.failure(MyError.somethingWrong()))
    }
    
}
