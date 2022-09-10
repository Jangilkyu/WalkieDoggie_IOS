//
//  WDColor.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/03.
//

import UIKit

enum WDColor {
    case darkGray
    case lightGray
    case red
    case blue
    
    var color: UIColor {
        switch self {
            case .darkGray:
                return UIColor(r: 44, g: 44, b: 44)
            case .lightGray
                return UIColor(r: 242, g: 242, b: 242)
            case .red:
                return UIColor(r: 255, g: 0, b: 0)
            case .blue:
                return UIColor(r: 64, g: 101, b: 247)
        }
    }
}


extension UIColor {
    public convenience init(
        r: Int,
        g: Int,
        b: Int,
        alpha: CGFloat = 1.0
    ) {
        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: alpha
        )
    }
}
