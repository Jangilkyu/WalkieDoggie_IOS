//
//  InfoManagementButton.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2023/01/07.
//

import UIKit

class InfoManagementButton: UIView {
  
  let button: UIButton = {
    let btn = UIButton()
    let image = UIImage(systemName: "greaterthan") //Your image here
    btn.setImage(image, for: .normal)
    btn.titleLabel?.font = WDFont.bold(size: 16)
    btn.setTitleColor(WDColor.darkGray.color, for: .normal)
    btn.semanticContentAttribute = .forceRightToLeft
    return btn
  }()
  
  required init(buttonTitle: String) {
    super.init(frame: .zero)
    button.setTitle(buttonTitle, for: .normal)
    setup()
  }
  
  required init?(coder: NSCoder) {
      return nil
  }
  
  private func setup() {
    addViews()
    setConstratins()
  }
  
  private func addViews() {
    addSubview(button)
  }
  
  private func setConstratins() {
    button.translatesAutoresizingMaskIntoConstraints = false
    button.imageView?.translatesAutoresizingMaskIntoConstraints = false
    button.contentHorizontalAlignment = .left
    button.imageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0.8).isActive = true
    button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0.0).isActive = true
    button.topAnchor.constraint(equalTo: topAnchor).isActive = true
    button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }

}
