//
//  PasswordValidationController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2023/01/08.
//

import UIKit
import Lottie

class PasswordValidationController: UIViewController {
  
  var user: User!
  var api: RestProcessor!
  var resHandler: ResHandler!
  
  let pwdTextField: UITextField = {
    let tf = UITextField()
    tf.autocapitalizationType = .none
    tf.isSecureTextEntry = true
    tf.placeholder = "비밀번호 입력"
    tf.layer.borderWidth = 1.0
    tf.layer.cornerRadius = 3
    tf.leftViewMode = .always
    tf.layer.borderColor = WDColor.lightGray.color.cgColor
    tf.addLeftPadding()
    return tf
  }()
  
  let checkButton = RoundedButton(buttonTItle: "확인")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
  }
  
  convenience init(_ user: User,
                   _ api: RestProcessor
  ) {
    self.init()
    self.user = user
    self.api = api
    api.requestDelegate = self
  }
  
  private func setup() {
    addViews()
    setConstraints()
    configureCheckButton()
  }
  
  private func addViews() {
    view.addSubview(pwdTextField)
    view.addSubview(checkButton)
  }
  
  private func setConstraints() {
    textFieldConstraints()
    checkButtonConstraints()
  }
  
  private func configureCheckButton() {
    checkButton.button.addTarget(
      self,
      action: #selector(handleCheckButton),
      for: .touchUpInside
    )
  }
  
  @objc private func handleCheckButton() {
    api.reqeustHttpHeaders.add(
      value: "application/json",
      forKey: "Content-Type"
    )
    
    api.reqeustHttpHeaders.add(
      value: "Bearer \(LS.getAccessToken()!)",
      forKey: "authorization"
    )
    
    checkButton.buttonState = .loading
    
    if let text = pwdTextField.text {
      api.httpBodyParameters.add(value: text, forKey: "password")
    }
    
    api.makeRequest(
      toURL: EndPoint.usersValid.url,
      withHttpMethod: .post,
      usage: .usersValid
    )
  }
  
  private func refreshAccessToken() {
    api.reqeustHttpHeaders.add(
      value: "application/json",
      forKey: "Content-Type")
    api.reqeustHttpHeaders.add(
      value: LS.getRefreshToken() ?? "",
      forKey: "refreshtoken")
    api.makeRequest(
      toURL: EndPoint.refresh.url,
      withHttpMethod: .get,
      usage: .refresh)
  }
  
  private func textFieldConstraints() {
    pwdTextField.translatesAutoresizingMaskIntoConstraints = false
    pwdTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    pwdTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    pwdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    pwdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
  }
  
  private func checkButtonConstraints() {
    checkButton.translatesAutoresizingMaskIntoConstraints = false
    checkButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    checkButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 30).isActive = true
    checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
  }
}

extension PasswordValidationController: RestProcessorRequestDelegate {
  func didFailToPrepareReqeust(
    _ result: RestProcessor.Results,
    _ usage: EndPoint
  ) {
    
  }
  
  func didReceiveResponseFromDataTask(
    _ result: RestProcessor.Results,
    _ usage: EndPoint
  ) {
    resHandler = ResHandler(result: result)
    if (usage == .usersValid) {
      switch resHandler.getResult() {
      case .ok(_, let data):
        if let data = data {
          let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments])
          let result = Bool(truncating: json as! NSNumber)
          if result == true {
            DispatchQueue.main.async {
                let completion: LottieCompletionBlock = { _ in
                    let mainVC = UserInfoController()
                    self.navigationController?.pushViewController(mainVC, animated: true)
                  self.checkButton.buttonState = .reset(buttonTitle: "확인")
                }
                self.checkButton.buttonState = .success(completion: completion)
            }
          } else {
            DispatchQueue.main.async {
              self.checkButton.buttonState = .failure(fallBack: "확인")
            }
          }
        }
      case .accessTokenExpired:
        refreshAccessToken()
      default:
        return
      }
    }
  }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(
      frame: CGRect(
        x: 0,
        y: 0,
        width: 10,
        height: self.frame.height
      )
    )
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
