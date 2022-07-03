//
//  RoundedButton.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/03.
//

import UIKit

class RoundedButton: UIView {
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = WDColor.darkGray.color
        btn.titleLabel?.font = WDFont.Black.of(size: 18)
        btn.frame.size = CGSize(width: 244, height: 47)
        btn.layer.cornerRadius = 30
        
        return btn
    }()
    
    required init(buttonTItle: String) {
        super.init(frame: .zero)
        button.setTitle(buttonTItle, for: .normal)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func addViews() {
        addSubview(button)
    }
    
    func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}
