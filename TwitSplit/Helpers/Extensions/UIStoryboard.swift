//
//  UIStoryboard.swift
//  TwitSplit
//
//  Created by Phat Chiem on 7/14/17.
//  Copyright © 2017 Phat Chiem. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func viewController(type: UIViewController.Type) -> UIViewController {
        return UIStoryboard.main.instantiateViewController(withIdentifier: type.identifier)
    }
}
