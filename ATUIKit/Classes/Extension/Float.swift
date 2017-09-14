//
//  Float.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

extension Float : CommonNumber {

    /// 适配iPhone 6的值
    public var fit6 : CGFloat {
        return F6(self)
    }
    
    public var f : CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat : CommonNumber{
    
    /// 适配iPhone 6的值
    public var fit6 : CGFloat {
        return F6(Float(self))
    }
    
    public var f : CGFloat {
        return self
    }
}

extension Double : CommonNumber{
    
    /// 适配iPhone 6的值
    public var fit6 : CGFloat {
        return F6(Float(self))
    }
    
    public var f : CGFloat {
        return CGFloat(self)
    }
}
