//
//  RegisterController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/04.
//

import UIKit
import Lottie

class RegisterController: UIViewController {
    
    var api: RestProcessor!
    
    let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "회원가입"
        lb.font = WDFont.bold(size: 25)
        lb.textAlignment = .left
        return lb
    }()
    
    let emailTextField = AuthTextField(
        titleText: "이메일",
        placeholderText: "이메일을 입력해주세요.",
        descriptionText: "이메일을 입력해주시기 바랍니다.",
        type: .email)
    
    let pwdTextField = AuthTextField(
        titleText: "비밀번호",
        placeholderText: "비밀번호를 입력해주세요.",
        descriptionText: "비밀번호는 6자리 이상이어야 합니다.",
        type: .password
    )
    
    let pwdValidateTextField = AuthTextField(
        titleText: "비밀번호 확인",
        placeholderText: "비밀번호를 입력해주세요.",
        descriptionText: "비밀번호가 일치하지 않습니다.",
        type: .password
    )
    
    let registerButton = RoundedButton(buttonTItle: "회원가입 하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addViews()
        setConstraints()
        setConfigureRestProcessor()
    }
    
    private func setup() {
        view.backgroundColor = .white
        configureRegisterButton()
    }
    
    private func configureRegisterButton() {
        registerButton.button.addTarget(
            self,
            action: #selector(handleRegisterButton),
            for: .touchUpInside)
    }
    
    @objc private func handleRegisterButton() {
        var shouldProceed: Bool = false

        if !emailTextField.textField.isEmail() {
            emailTextField.showErrorDescription()
            emailTextField.showValidationErrorColor()
            shouldProceed = false
        } else {
            emailTextField.hideErrorDescription()
            emailTextField.hideValidationErrorColor()
            shouldProceed = true
        }
        
        if !pwdTextField.textField.isValidPwd() {
            pwdTextField.showErrorDescription()
            pwdTextField.showValidationErrorColor()
            shouldProceed = false
        } else if shouldProceed {
            pwdTextField.hideErrorDescription()
            pwdTextField.hideValidationErrorColor()
            shouldProceed = true
        }
        
        if pwdTextField.textField.text != pwdValidateTextField.textField.text || pwdTextField.textField.text?.count == 0 {
            pwdValidateTextField.showErrorDescription()
            pwdValidateTextField.showValidationErrorColor()
            shouldProceed = false
        } else if shouldProceed {
            pwdValidateTextField.hideErrorDescription()
            pwdValidateTextField.hideValidationErrorColor()
            shouldProceed = true
        }
        
        guard shouldProceed else { return }
        registerButton.buttonState = .loading
        
        if  let email = emailTextField.textField.text,
            let pwd = pwdTextField.textField.text {

            api.reqeustHttpHeaders.add(
                value: "application/json",
                forKey: "Content-Type"
            )

            api.httpBodyParameters.add(
                value: email,
                forKey: "email"
            )
            api.httpBodyParameters.add(
                value: pwd,
                forKey: "password"
            )

            api.makeRequest(
                toURL: EndPoint.register.url,
                withHttpMethod: .post
            )
        }
    }
    
    private func addViews() {
        view.addSubview(mainLabel)
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(pwdValidateTextField)
        view.addSubview(registerButton)
    }
    
    private func setConstraints() {
        mainLabelConstraints()
        emailTextFieldConstraints()
        pwdTextFieldConstraints()
        pwdValidateTextFieldConstraints()
        registerButtonConstraints()
    }
    
    private func setConfigureRestProcessor() {
        api = RestProcessor()
        api.requestDelegate = self
    }
    
    private func mainLabelConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 88).isActive = true
        emailTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func pwdTextFieldConstraints() {
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pwdTextField.heightAnchor.constraint(equalToConstant: 88).isActive = true
        pwdTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        pwdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func pwdValidateTextFieldConstraints() {
        pwdValidateTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdValidateTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pwdValidateTextField.heightAnchor.constraint(equalToConstant: 88).isActive = true
        pwdValidateTextField.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor).isActive = true
        pwdValidateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func registerButtonConstraints() {
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.widthAnchor.constraint(equalToConstant: 230).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: pwdValidateTextField.bottomAnchor).isActive = true
    }

}

extension RegisterController: RestProcessorRequestDelegate {
    func didFailToPrepareReqeust(
        _ result: RestProcessor.Results
    ) {
        DispatchQueue.main.async {
            self.registerButton.buttonState = .failure(fallBack: "회원가입 하기")
        }
    }
    
    func didReceiveResponseFromDataTask(
        _ result: RestProcessor.Results
    ) {
        let responseHandler = ResHandler(result: result)
        
        switch responseHandler.getResult() {
            case .created:
                DispatchQueue.main.async {
                    let completion: LottieCompletionBlock = { _ in
                        let mainVC = MainController()
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                    self.registerButton.buttonState = .success(completion: completion)
                }
            
            case .duplicateEmail:
                DispatchQueue.main.async {
                    self.emailTextField.showErrorDescription("이미 존재하는 이메일 입니다.")
                    self.registerButton.buttonState = .failure(fallBack: "회원가입 하기")
                }
            case .serverError:
              DispatchQueue.main.async {
                self.registerButton.buttonState = .failure(fallBack: "회원가입 하기")
              }
        default:
            return
        }
    }
}
