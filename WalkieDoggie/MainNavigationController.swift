//
//  MainNavigationController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/06.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
      super.viewDidLoad()
        
        if let _ = LS.getAccessToken() {
            viewControllers = [MainController()]
        } else {
            viewControllers = [LoginController()]
        }
    }
}
