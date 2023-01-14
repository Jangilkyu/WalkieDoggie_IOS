//
//  ProfileUpdateController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/11/19.
//

import UIKit

class ProfileUpdateController: UIViewController {
  
  var user: User?
  var api: RestProcessor!
  let userInfoButton = InfoManagementButton(buttonTitle: "회원 정보")
  let myInfoView = MyInfoView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
  }
  
  convenience init(_ user: User, _ api: RestProcessor) {
    self.init()
    self.user = user
    self.api = api
    myInfoView.userNameLabel.text = user.name
    myInfoView.userPhoneNumberLabel.text = user.phoneNumber
    myInfoView.userEmailLabel.text = user.email
  }
  
  private func setup() {
    addViews()
    setConstratins()
    configureUserInfoButton()
  }
  
  private func addViews() {
    view.addSubview(userInfoButton)
    view.addSubview(myInfoView)
  }
  
  private func setConstratins() {
    userInfoButtonConstraints()
    myInfoViewConstraints()
  }
  
  private func configureUserInfoButton() {
    userInfoButton.button.addTarget(
        self,
        action: #selector(handleUserInfoButton),
        for: .touchUpInside
    )
  }
  
  @objc private func handleUserInfoButton() {
    guard let user = self.user else { return }
    let passwordValidationController = PasswordValidationController(user, api)
    navigationController?.pushViewController(passwordValidationController, animated: true)
  }
  
  private func userInfoButtonConstraints() {
    userInfoButton.translatesAutoresizingMaskIntoConstraints = false
    userInfoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    userInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    userInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
  }
  
  private func myInfoViewConstraints() {
    myInfoView.translatesAutoresizingMaskIntoConstraints = false
    myInfoView.topAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: 10).isActive = true
    myInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    myInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
  }

}
