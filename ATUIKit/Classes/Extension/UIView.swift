//
//  UIView.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

extension UIView {
    
    /// 设置边框
    ///
    /// - Parameters:
    ///   - color: 边框颜色
    ///   - width: 边框宽度
    /// - Returns: 返回自身，方便链式操作
    @discardableResult
    public func border(_ color:UIColor?,_ width:CGFloat = 1.pix) -> UIView {
        self.layer.borderWidth = width
        if color != nil {
            self.layer.borderColor = color!.cgColor
        }
        return self
    }
    
    /// 设置圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - autoFit: 是否自动适配，默认 true
    /// - Returns: 返回自身，方便链式操作
    @discardableResult
    public func cornerRadius<T:CommonNumber>(_ radius:T,_ autoFit:Bool = true) -> UIView {
        let r = autoFit ? radius.fit6 : radius.f
        self.layer.cornerRadius = r
        self.clipsToBounds = true
        return self
    }
}

extension UIView {
    open var left : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    open var top : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    open var right : CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            self.frame.origin.x = newValue - self.width
        }
    }
    
    open var width : CGFloat {
        get {
            return self.bounds.width
        }
        set {
            self.bounds.size.width = newValue
        }
    }
    
    open var height : CGFloat {
        get {
            return self.bounds.height
        }
        set {
            self.bounds.size.height = newValue
        }
    }
    
    open var bottom : CGFloat {
        get {
            return self.frame.maxY
        }
        set {
            self.frame.origin.y = newValue - self.height
        }
    }
    
    open var centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: centerY)
        }
    }
    
    open var centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: centerX, y: newValue)
        }
    }
}


public enum ViewActionType {
    case tap
    case longPress
}

extension UIView {
    open func addTarget(_ target:Any ,action : Selector,on : ViewActionType = .tap) {
        var g : UIGestureRecognizer?
        switch on {
        case .tap:
            g = UITapGestureRecognizer.init(target: target, action: action)
        default:
            g = UILongPressGestureRecognizer.init(target: target, action: action)
        }
        self.addGestureRecognizer(g!)
    }
}
