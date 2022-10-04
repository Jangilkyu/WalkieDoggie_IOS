//
//  CenterDtBtuttonCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/29.
//

import UIKit


class CenterDtBtuttonCell: UICollectionViewCell {
  
  let centerButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("봉사활동 신청하기", for: .normal)
    btn.titleLabel?.font = WDFont.bold(size: 20)
    btn.backgroundColor = WDColor.darkGray.color
    btn.layer.cornerRadius = 10
    return btn
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemOrange
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
    addSubview(centerButton)
  }
  
  private func setConstraints() {
    centerButtonConstraints()
  }
  
  private func centerButtonConstraints() {
    centerButton.translatesAutoresizingMaskIntoConstraints = false
    centerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    centerButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    centerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    centerButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
}
