//
//  CommonNumber.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/12.
//
//

import UIKit

public protocol CommonNumber {

    var toFloat : Float {get}
    
    var fit6 : CGFloat {get}
    
    var f : CGFloat {get}
}


extension CommonNumber {
    /// 适配iPhone 6的值
    public var fit6 : CGFloat {
        return F6(self.toFloat)
    }
    
    public var f : CGFloat {
        return CGFloat(self.toFloat)
    }
}
