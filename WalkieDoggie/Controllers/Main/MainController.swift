//
//  MainController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/06.
//

import UIKit

class MainController: UIViewController {
    
    let titleLabel: UILabel = {
       let lb = UILabel()
        lb.text = "가까운 유기견 센터 목록"
        lb.font = WDFont.Medium.of(size: 23)
       return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)

        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        titleLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    }
}
