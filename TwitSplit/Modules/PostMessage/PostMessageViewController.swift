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
    
    var viewModel: PostMessageViewModel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setUpUI()
    }

    // MARK: - Bind UI
    func bindUI() {

    }

    // MARK: - Setup UI
    func setUpUI() {

    }
}
