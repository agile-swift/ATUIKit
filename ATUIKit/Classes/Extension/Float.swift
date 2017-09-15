//
//  Float.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

extension Float : CommonNumber {

    public var toFloat: Float {
        return self
    }
}

extension CGFloat : CommonNumber{
    
    public var toFloat: Float {
        return Float(self)
    }
}

extension Double : CommonNumber{
    
    public var toFloat: Float {
        return Float(self)
    }

}
