//
//  Int.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

extension Int : CommonNumber {
    
    /// 像素点
    public var pix : CGFloat {
        return CGFloat(self) * Pix
    }
    
    public var toFloat: Float {
        return Float(self)
    }
}
