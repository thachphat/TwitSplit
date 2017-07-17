//
//  PostMessagePostMessageViewController.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostMessageViewController: BaseViewController {
    
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    var viewModel = PostMessageViewModel(provider: TwitterProvider())
    let disposeBag = DisposeBag()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setUpUI()
    }
    
    // MARK: - Bind UI
    func bindUI() {
        logOutButton.rx.tap.bind(to: viewModel.logOutTapped).addDisposableTo(disposeBag)
        
        viewModel.logOutFinished
            .drive(onNext: { [weak self] result in
                switch result {
                    
                case .failure(let error):
                    let alert = UIAlertController(title: "Oops!", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
                    self?.present(alert, animated: true, completion: nil)
                case .success:
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        appDelegate.showRootView()
                    }
                }
            })
            .addDisposableTo(disposeBag)
    }
    
    // MARK: - Setup UI
    func setUpUI() {
        
    }
}
