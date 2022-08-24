//
//  CustomTabBarController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/20.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController,UITabBarControllerDelegate{
    
    // MARK: - Controllers
    var mainController: MainController!
    var profileController: ProfileController!
    
    // MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBarAppearance()
    }
    
    // MARK: - setup
    private func setup() {
        
        configureMainController()
        configureProfileController()
        setViewControllers([
            mainController,
            profileController
         ]
         ,
            animated: true)
    }
    
    private func setupTabBarAppearance() {
        tabBar.isTranslucent = true
        tabBar.barTintColor = .black
    }
    
    private func configureMainController() {
        let mainImage = UIImage(named: "homeicon")?
            .resized(to: CGSize(width: 40, height: 40))
            .changeColor(to: .black)
        
        let mainImageSelected = UIImage(named: "homeiconselected")?
            .resized(to: CGSize(width: 40, height: 40))
            .changeColor(to: .black)
        
        let barItem = UITabBarItem(
            title: nil,
            image: mainImage,
            tag: 0
        )
        
        barItem.selectedImage = mainImageSelected
        
        mainController = MainController()
        mainController.tabBarItem = barItem
    }
    
    private func configureProfileController() {
        let profileImage = UIImage(named: "profileicon")?
            .resized(to: CGSize(width: 40, height: 40))
            .changeColor(to: .black)
        
        let profileImageSelected = UIImage(named: "profileiconselected")?
            .resized(to: CGSize(width: 40, height: 40))
            .changeColor(to: .black)
        
        let barItem = UITabBarItem(
            title: nil,
            image: profileImage,
            tag: 0
        )
        
        barItem.selectedImage = profileImageSelected
        
        profileController = ProfileController()
        profileController.tabBarItem = barItem
    }
}
