//
//  AuthTextFiled.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/06/28.
//

import UIKit

class AuthTextField: UIView {
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = WDFont.regular(size: 12)
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.font = WDFont.regular(size: 12)
        lb.textColor = .red
        lb.isHidden = true
        return lb
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    let textFieldUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    required init(
        titleText: String,
        placeholderText: String,
        descriptionText: String,
        type: AuthTextFieldTypes
    ) {
        super.init(frame: .zero)
        titleLabel.text = titleText
        textField.placeholder = placeholderText
        descriptionLabel.text = descriptionText
        setType(type: type)
        
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func showErrorDescription() {
        descriptionLabel.isHidden = false
    }
    
    func hideErrorDescription() {
        descriptionLabel.isHidden = true
    }
    
    func showValidationErrorColor() {
        titleLabel.textColor = WDColor.red.color
        textField.tintColor = WDColor.red.color
    }
    
    func hideValidationErrorColor() {
        titleLabel.textColor = WDColor.darkGray.color
        textField.tintColor = WDColor.blue.color
    }
    
    private func setType(type: AuthTextFieldTypes) {
        switch type {
        case .email:
            textField.keyboardType = .emailAddress
            textField.textContentType = .emailAddress
            textField.autocorrectionType = .no
        case .password:
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.textContentType = .password
        }
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(textFieldUnderLine)
        addSubview(descriptionLabel)
    }
    
    private func setConstraints() {
        titleLabelConstraints()
        textFieldConstraints()
        textFieldUnderLineConstratins()
        descriptionLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func textFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func textFieldUnderLineConstratins() {
        textFieldUnderLine.translatesAutoresizingMaskIntoConstraints = false
        textFieldUnderLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        textFieldUnderLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textFieldUnderLine.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        textFieldUnderLine.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    private func descriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: textFieldUnderLine.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
}
