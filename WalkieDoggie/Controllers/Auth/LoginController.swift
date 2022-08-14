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
    
    let loginButton = RoundedButton(buttonTItle: "로그인 하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = .white
        configureLoginButton()
    }
    
    func configureLoginButton() {
        loginButton.button.addTarget(
            self,
            action: #selector(handleLoginButton),
            for: .touchUpInside
        )
    }
    
    @objc func handleLoginButton() {
        if !emailTextField.textField.isEmail() {
            emailTextField.showErrorDescription()
            emailTextField.showValidationErrorColor()
        } else {
            emailTextField.hideErrorDescription()
            emailTextField.hideValidationErrorColor()
        }
        
        if !pwdTextField.textField.isValidPwd() {
            pwdTextField.showErrorDescription()
            pwdTextField.showValidationErrorColor()
        } else {
            pwdTextField.hideErrorDescription()
            pwdTextField.hideValidationErrorColor()
        }
    }
    
    func addViews() {
        view.addSubview(mainLabel)
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
    }
    
    // Constraints
    func setConstraints() {
        mainLabelConstraints()
        emailTextFieldConstraints()
        pwdTextFieldConstraints()
        loginButtonConstraints()
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
        pwdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        pwdTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    }
    
    func loginButtonConstraints() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 230).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 50).isActive = true
    }
}

extension LoginController: RestProcessorRequestDelegate {
    func didFailToPrepareReqeust(_ result: RestProcessor.Results) {
        
    }
    
    func didReceiveResponseFromDataTask(_ result: RestProcessor.Results) {
        
    }
}
