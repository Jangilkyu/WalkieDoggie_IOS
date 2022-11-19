//
//  ProfileController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/21.
//

import UIKit

class ProfileController: UIViewController {
  
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "내 프로필"
    lb.font = WDFont.Medium.of(size: 30)
    lb.textColor = WDColor.darkGray.color
    return lb
  }()
  
  let imageView: UIImageView = {
    let image = UIImage(named: "gurm")
    let iv = UIImageView(image: image)
    return iv
  }()
  
  let editButton = RoundedButton(buttonTItle: "프로필 편집")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.setHidesBackButton(true, animated: false)
    setup()
  }
  
  private func setup() {
    addViews()
    setConstraints()
  }
  
  private func addViews() {
    view.addSubview(titleLabel)
    view.addSubview(imageView)
    view.addSubview(editButton)
  }
  
  private func setConstraints() {
    titleLabelConstraints()
    imageViewConstraints()
    editButtonConstraints()
  }
  
  private func titleLabelConstraints() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
  }
  
  private func imageViewConstraints() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  private func editButtonConstraints() {
    editButton.translatesAutoresizingMaskIntoConstraints = false
    editButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
    editButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
    editButton.centerYAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
  }
  
}
