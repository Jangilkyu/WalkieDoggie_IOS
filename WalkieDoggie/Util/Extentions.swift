//
//  Extentions.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/07.
//

import UIKit

extension String {
    func isEmail() -> Bool {
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
        let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        
        return __emailPredicate.evaluate(with: self)
    }
    
    func isValidPwd() -> Bool {
        return self.count > 5
    }
}

extension UITextField {
    
    func isEmail() -> Bool {
        return self.text?.isEmail() ?? false
    }
    
    func isValidPwd() -> Bool {
        return self.text?.isValidPwd() ?? false
    }
}

extension UIImage {
        func resized(to target: CGSize) -> UIImage {
            // 비율 계산
            let ratio = min(target.height / size.height, target.width / size.width)
            
            // 새로운 사이즈
            let new = CGSize(width: size.width * ratio, height: size.height * ratio)
            let renderer = UIGraphicsImageRenderer(size: new)
            return renderer.image { _ in
                self.draw(in: CGRect(origin: .zero, size: new))
            }
    }
    
    func changeColor(to color: UIColor) -> UIImage {
        return self.withRenderingMode(.alwaysOriginal).withTintColor(color)
    }
}

extension UIView {
  func removeGradient() {
    layer.sublayers = nil
  }
  
  func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
