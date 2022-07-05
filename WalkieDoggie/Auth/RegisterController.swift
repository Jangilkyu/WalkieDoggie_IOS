//
//  RegisterController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/04.
//

import UIKit

class RegisterController: UIViewController {
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "회원가입"
        lb.font = WDFont.bold(size: 25)
        lb.textAlignment = .left
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = .white
    }
    
    func addViews() {
        view.addSubview(mainLabel)
    }
    
    func setConstraints() {
        mainLabelConstraints()
    }
    
    func mainLabelConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true

    }
    
}
