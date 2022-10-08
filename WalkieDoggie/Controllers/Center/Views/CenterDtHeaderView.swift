//
//  CenterDtHeaderView.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/29.
//

import UIKit

class CenterDtHeaderView: UICollectionReusableView {
  
  let imageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "dog"))
    iv.contentMode = .scaleAspectFill
    iv.layer.masksToBounds = true
    return iv
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
  }
  
  private func addViews() {
    addSubview(imageView)
  }
  
  private func setConstraints() {
    imageViewConstraints()
  }
  
  private func imageViewConstraints() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
}
