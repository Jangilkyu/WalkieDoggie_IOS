//
//  MainController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/06.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)

        setup()
    }
    
    private func setup() {
        view.backgroundColor = .blue
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        
    }
    
    private func addConstraints() {
        
    }
}
