//
//  MainCell.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/28.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    let mainImageView: UIImageView = {
        let image = UIImage(named: "dorosi")
        let iv = UIImageView(image: image)
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let mainTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "도로시 지켜줄게"
        lb.font = WDFont.Medium.of(size: 23)
        lb.textAlignment = .left
        return lb
    }()
    
    let mainSubTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "실내청소 / 산책 / 목욕  / 놀이 / 입양 사진 촬영"
        lb.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        lb.textAlignment = .left
        lb.numberOfLines = 2
        
        return lb
    }()
    
    let mainDistanceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1km"
        lb.font = WDFont.Regular.of(size: 12)
        return lb
    }()
    
    let mainAddressLabel: UILabel = {
        let lb = UILabel()
        lb.text = "서울시 수정동 가나다로 58334-1번지 3층 (스타벅스 옆 건물)"
        lb.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        lb.textAlignment = .left
        lb.numberOfLines = 2
        return lb
    }()
    
    let mainHoriLine: UIView = {
        let line = UIView()
        line.backgroundColor = WDColor.lightGray.color
        return line
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
        addSubview(mainImageView)
        addSubview(mainTitleLabel)
        addSubview(mainSubTitleLabel)
        addSubview(mainDistanceLabel)
        addSubview(mainAddressLabel)
        addSubview(mainHoriLine)
    }
    
    private func setConstraints() {
        mainImageViewConstraints()
        mainTitleLabelConstraints()
        mainSubTitleLabelConstraints()
        mainDistanceLabelConstraints()
        mainAddressLabelConstraints()
        mainHoriLineConstraints()
    }
    
    private func mainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
    
    private func mainTitleLabelConstraints() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTitleLabel.heightAnchor.constraint(equalTo: mainImageView.heightAnchor, multiplier: 0.4).isActive = true
        mainTitleLabel.topAnchor.constraint(equalTo: mainImageView.topAnchor).isActive = true
        mainTitleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10).isActive = true
        mainTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func mainSubTitleLabelConstraints() {
        mainSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainSubTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 10).isActive = true
        mainSubTitleLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10).isActive = true
    }
    
    private func mainDistanceLabelConstraints() {
        mainDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        mainDistanceLabel.topAnchor.constraint(equalTo: mainSubTitleLabel.bottomAnchor, constant: 10).isActive = true
        mainDistanceLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10).isActive = true
    }
    
    private func mainAddressLabelConstraints() {
        mainAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        mainAddressLabel.topAnchor.constraint(equalTo: mainDistanceLabel.bottomAnchor, constant:  10).isActive = true
        mainAddressLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10).isActive = true
        mainAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func mainHoriLineConstraints() {
        mainHoriLine.translatesAutoresizingMaskIntoConstraints = false
        mainHoriLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        mainHoriLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainHoriLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mainHoriLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
