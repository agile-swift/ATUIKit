//
//  UIColor.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

extension UIColor : Background {
    
    /// 随机颜色
    open class var random: UIColor {
        return UIColor.init(red: CGFloat(arc4random_uniform(256)) / 255.0  , green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1)
    }
    
    public convenience init(hex value:Int) {
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0x00FF00) >> 8) / 255.0
        let b = CGFloat((value & 0x0000FF)) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
