//
//  LoginController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/06/28.
//

import UIKit

class LoginController: UIViewController {
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "로그인"
        lb.font = WDFont.bold(size: 25)
        lb.textAlignment = .left
        
        return lb
    }()
    
    let emailTextField = AuthTextField(
        titleText: "이메일",
        placeholderText: "이메일을 입력해주세요.",
        descriptionText: "이메일이 유효하지 않습니다.",
        type: .email
    )
    
    let pwdTextField = AuthTextField(
        titleText: "비밀번호",
        placeholderText: "비밀번호를 입력해주세요.",
        descriptionText: "비밀번호는 6자리 이상이어야 합니다.",
        type: .password
    )
    
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
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
    }
    
    // Constraints
    func setConstraints() {
        mainLabelConstraints()
        emailTextFieldConstraints()
        pwdTextFieldConstraints()
    }
    
    func mainLabelConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 88).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        emailTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
    }
    
    func pwdTextFieldConstraints() {
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pwdTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pwdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwdTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    }
}
