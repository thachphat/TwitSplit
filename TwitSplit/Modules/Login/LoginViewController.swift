//
//  LoginLoginViewController.swift
//  TwitSplit
//
//  Created by Phat Chiem on 14/07/2017.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginTwitterButton: UIButton!
    
    var viewModel = LoginViewModel(provider: TwitterProvider())
    fileprivate let disposeBag = DisposeBag()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setUpUI()
    }

    // MARK: - Bind UI
    func bindUI() {
        loginTwitterButton.rx.tap.bind(to: viewModel.loginTapped).addDisposableTo(disposeBag)
        
        viewModel.loginFinished.drive(onNext: { [weak self] loginResult in
            switch loginResult {
            case .failed(let message):
                let alert = UIAlertController(title: "Oops!", message:message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
                self?.present(alert, animated: true, completion: nil)
            case .ok:
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                    appDelegate.showRootView()
                }
            }
        }).addDisposableTo(disposeBag)
    }

    // MARK: - Setup UI
    func setUpUI() {

    }
    
}
