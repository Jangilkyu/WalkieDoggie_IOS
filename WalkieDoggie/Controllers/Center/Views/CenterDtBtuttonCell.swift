//
//  CenterDtBtuttonCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/29.
//

import UIKit

protocol CenterDtButtonCellDelegate: AnyObject {
  func didSelectButton(_ button: UIButton)
}

class CenterDtBtuttonCell: UICollectionViewCell {
  
  weak var delegate: CenterDtButtonCellDelegate?
  
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
    setup()
  }

  required init?(coder: NSCoder) {
    return nil
  }
  
  private func setup() {
    addViews()
    setConstraints()
    configureMainButton()
  }
  
  private func addViews() {
    addSubview(centerButton)
  }
  
  private func setConstraints() {
    centerButtonConstraints()
  }
  
  private func configureMainButton() {
    centerButton.addTarget(
      self,
      action: #selector(handleCenterButton),
      for: .touchUpInside
    )
  }
  
  @objc func handleCenterButton(button: UIButton) {
    delegate?.didSelectButton(button)
  }
  
  private func centerButtonConstraints() {
    centerButton.translatesAutoresizingMaskIntoConstraints = false
    centerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    centerButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    centerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    centerButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
}
