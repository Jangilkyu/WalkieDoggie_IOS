//
//  CenterAnimalInfoCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/28.
//

import UIKit

class CenterAnimalInfoCell: UICollectionViewCell {
  
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
  }
  
  private func setConstraints() {
  }
}
