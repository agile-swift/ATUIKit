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
    
    /// 适配iPhone 6的值
    public var fit6 : CGFloat {
        return F6(Float(self))
    }
    
    public var f : CGFloat {
        return CGFloat(self)
    }
}
