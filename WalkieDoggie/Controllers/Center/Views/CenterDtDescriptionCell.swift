//
//  CenterDtDescriptionCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/29.
//

import UIKit

class CenterDtDescriptionCell: UICollectionViewCell {
  let centerDescLabel: UILabel = {
    let centerDescLabel = UILabel()
    centerDescLabel.text = "💕 유기견 입양 카페, 유기견 쉼터, 동물 보호 단체 💕\n❤️‍🔥도로시지켜줄개와 함께해주실 소중한 봉사자분들을 모집합니다.❤️‍🔥\n 🐶 아가들을위해 소중한 시간을 허락해주셔서 감사합니다"
    centerDescLabel.numberOfLines = 0
    centerDescLabel.textAlignment = .center

    return centerDescLabel
  }()
  
  required init?(coder: NSCoder) {
    return nil
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .gray
    setup()
  }
  
  private func setup() {
    addViews()
    setConstraints()
  }
  
  private func addViews() {
    addSubview(centerDescLabel)
  }
  
  private func setConstraints() {
    centerDescLabelConstraints()
  }
  
  private func centerDescLabelConstraints() {
    centerDescLabel.translatesAutoresizingMaskIntoConstraints = false
    centerDescLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    centerDescLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    centerDescLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

  }
}
