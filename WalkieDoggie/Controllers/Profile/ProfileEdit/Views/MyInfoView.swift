//
//  MyInfoView.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2023/01/07.
//

import UIKit

class MyInfoView: UIView {
  
  let nameLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.bold(size: 14)
    lb.text = "이름"
    return lb
  }()
  
  let userNameLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.regular(size: 14)
    lb.text = "장*규"
    return lb
  }()
  
  let emailLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.bold(size: 14)
    lb.text = "이메일"
    return lb
  }()
  
  let userEmailLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.regular(size: 14)
    lb.text = "test@gmail.com"
    return lb
  }()
  
  let phoneNumberLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.bold(size: 14)
    lb.text = "휴대전화"
    return lb
  }()
  
  let userPhoneNumberLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.regular(size: 14)
    lb.text = "010-****-7082"
    return lb
  }()
  
  
  let roleLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.bold(size: 14)
    lb.text = "회원등급"
    return lb
  }()
  
  let userRoleLabel: UILabel = {
    let lb = UILabel()
    lb.font = WDFont.regular(size: 14)
    lb.text = "천사"
    return lb
  }()
  
  required init() {
    super.init(frame: .zero)
    setup()
  }
  
  required init?(coder: NSCoder) {
      return nil
  }
  
  private func setup() {
    addViews()
    setConstraints()
  }
  
  private func addViews() {
    addSubview(nameLabel)
    addSubview(userNameLabel)
    addSubview(phoneNumberLabel)
    addSubview(userPhoneNumberLabel)
    addSubview(emailLabel)
    addSubview(userEmailLabel)
    addSubview(roleLabel)
    addSubview(userRoleLabel)
  }
  
  private func setConstraints() {
    nameLabelConstraints()
    userNameLabelConstraints()
    phoneNumberLabelConstraints()
    userPhoneNumberLabelConstraints()
    roleLabelConstraints()
    userRoleLabelConstraints()
    emailLabelConstraints()
    userEmailLabelConstraints()
  }
  private func nameLabelConstraints() {
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.widthAnchor.constraint(equalTo: phoneNumberLabel.widthAnchor).isActive = true
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
  }
  
  private func userNameLabelConstraints() {
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    userNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10).isActive = true
  }
  
  private func phoneNumberLabelConstraints() {
    phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    phoneNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10).isActive = true
    phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
  }

  private func userPhoneNumberLabelConstraints() {
    userPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    userPhoneNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10).isActive = true
    userPhoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberLabel.trailingAnchor, constant: 10).isActive = true
  }
  
  private func emailLabelConstraints() {
    emailLabel.translatesAutoresizingMaskIntoConstraints = false
    emailLabel.widthAnchor.constraint(equalTo: roleLabel.widthAnchor).isActive = true
    emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    emailLabel.leadingAnchor.constraint(equalTo: userPhoneNumberLabel.trailingAnchor, constant: 10).isActive = true
  }
  
  private func userEmailLabelConstraints() {
    userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
    userEmailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    userEmailLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 10).isActive = true
  }
  
  private func roleLabelConstraints() {
    roleLabel.translatesAutoresizingMaskIntoConstraints = false
    roleLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
    roleLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor).isActive = true
  }
  
  private func userRoleLabelConstraints() {
    userRoleLabel.translatesAutoresizingMaskIntoConstraints = false
    userRoleLabel.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 10).isActive = true
    userRoleLabel.leadingAnchor.constraint(equalTo: userEmailLabel.leadingAnchor).isActive = true
  }
  
}
