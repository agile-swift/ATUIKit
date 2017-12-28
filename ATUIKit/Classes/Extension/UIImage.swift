//
//  UIImage.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

public enum ImageScaleOption {
    case none
    case circle
    case circleBorder(width:CGFloat,color:UIColor)
}

extension UIImage : Background {
    
    /// 颜色转图片方法
    ///
    /// - Parameter color: 待转换颜色
    public convenience init(color:UIColor) {
        let rect = CGRect(x: 0.0,y: 0.0,width: 1.0,height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()
        self.init(cgImage: image!)
    }
    
    
    /// 转换图片到指定大小
    ///
    /// - Parameters:
    ///   - size: 指定的尺寸
    ///   - option: 可选项，默认为空
    ///   - opaque: 是否不透明，默认为false
    ///   - screenScale: 屏幕分辨，默认为0
    /// - Returns: 转换后的图片
    public func imageScaleToSize(_ size:CGSize,option:ImageScaleOption = .none,opaque:Bool = false, screenScale:Int = 0) -> UIImage {
        let rect = CGRect.init(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, opaque, CGFloat(screenScale))
        let path = UIBezierPath.init(ovalIn: rect)
        
        switch option {
        case .none:
            self.draw(in: rect)
            break
        case .circleBorder(width: let width, color: let color):
            path.addClip()
            self.draw(in: rect)
            color.setStroke()
            path.lineWidth = width
            path.stroke()
            break
        case .circle:
            path.addClip()
            self.draw(in: rect)
            break
        }
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
        
    }
}
