//
//  CenterAnimalInfoCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/28.
//

import UIKit

class CenterAnimalInfoCell: UICollectionViewCell {
  
  let animalImageView: UIImageView = {
    let image = UIImage(named: "roy")
    let iv = UIImageView(image: image)
    return iv
  }()
  
  let animalNameLabel: UILabel = {
    let animalName = UILabel()
    animalName.text = "로이"
//    animalName.backgroundColor = .systemRed
    animalName.font = WDFont.Bold.of(size: 22)
    animalName.sizeToFit()
    animalName.textAlignment = .left
    return animalName
  }()
  
  let animalGenderLabel: UILabel = {
    let animalGender = UILabel()
    animalGender.font = WDFont.Bold.of(size: 14)
    animalGender.text = "(수컷)"
//    animalGender.backgroundColor = .brown
    animalGender.numberOfLines = 0
    animalGender.textAlignment = .left
    return animalGender
  }()
  
  let animalBornLabel: UILabel = {
    let animalBorn = UILabel()
    animalBorn.font = WDFont.Medium.of(size: 14)
    animalBorn.text = "3살"
//    animalBorn.backgroundColor = .magenta
//    animalBorn.numberOfLines = 0
//    animalBorn.textAlignment = .left
    return animalBorn
  }()
  
  let animalKindLabel: UILabel = {
    let animalKind = UILabel()
    animalKind.text = "치와와"
    animalKind.font = WDFont.Medium.of(size: 14)
//    animalKind.backgroundColor = .blue
    animalKind.numberOfLines = 0
    animalKind.textAlignment = .left
    return animalKind
  }()
  
  let animalDescriptionLabel: UILabel = {
    let animalDescription = UILabel()
    animalDescription.font = WDFont.Medium.of(size: 14)
    animalDescription.text = "뛰어도 천천히 뛰어요.\n냄새맡는거 좋아해요~~!🥰뛰어도 천천히 뛰어요.\n냄새맡는거 좋아해요~~!🥰뛰어도 천천히 뛰어요.\n냄새맡는거 좋아해요~~!🥰뛰어도 천천히 뛰어요.\n냄새맡는거 좋아해요~~!🥰"
    animalDescription.numberOfLines = 0
    animalDescription.sizeToFit()
    animalDescription.textAlignment = .left
    return animalDescription
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = WDColor.lightGray.color
    layer.cornerRadius = 10
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
    addSubview(animalImageView)
    addSubview(animalNameLabel)
    addSubview(animalGenderLabel)
    addSubview(animalBornLabel)
    addSubview(animalKindLabel)
    addSubview(animalDescriptionLabel)
  }
  
  private func setConstraints() {
    animalImageViewConstraints()
    animalNameLabelConstraints()
    animalGenderLabelConstraints()
    animalBornLabelConstraints()
    animalKindLabelConstraints()
    animalDescriptionLabelConstraints()
  }
  
  private func animalImageViewConstraints() {
    animalImageView.translatesAutoresizingMaskIntoConstraints = false
    animalImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    animalImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
    animalImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    animalImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  private func animalNameLabelConstraints() {
    animalNameLabel.translatesAutoresizingMaskIntoConstraints = false
    animalNameLabel.topAnchor.constraint(equalTo: animalImageView.topAnchor).isActive = true
    animalNameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 10).isActive = true
  }
  
  private func animalGenderLabelConstraints() {
    animalGenderLabel.translatesAutoresizingMaskIntoConstraints = false
    animalGenderLabel.heightAnchor.constraint(equalTo: animalNameLabel.heightAnchor).isActive = true
    animalGenderLabel.bottomAnchor.constraint(equalTo: animalNameLabel.bottomAnchor).isActive = true
    animalGenderLabel.leadingAnchor.constraint(equalTo: animalNameLabel.trailingAnchor, constant: 2).isActive = true
  }
  
  private func animalBornLabelConstraints() {
    animalBornLabel.translatesAutoresizingMaskIntoConstraints = false
//    animalBornLabel.widthAnchor.constraint(equalTo: animalNameLabel.widthAnchor).isActive = true
    animalBornLabel.topAnchor.constraint(equalTo: animalNameLabel.bottomAnchor).isActive = true
    animalBornLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 10).isActive = true
  }
  
  private func animalKindLabelConstraints() {
    animalKindLabel.translatesAutoresizingMaskIntoConstraints = false
    animalKindLabel.topAnchor.constraint(equalTo: animalGenderLabel.bottomAnchor).isActive = true
    animalKindLabel.leadingAnchor.constraint(equalTo: animalBornLabel.trailingAnchor, constant: 3).isActive = true
  }
  
  private func animalDescriptionLabelConstraints() {
    animalDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    animalDescriptionLabel.topAnchor.constraint(equalTo: animalBornLabel.bottomAnchor).isActive = true
    animalDescriptionLabel.bottomAnchor.constraint(equalTo: animalImageView.bottomAnchor).isActive = true
    animalDescriptionLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 10).isActive = true
    animalDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
  }
}
