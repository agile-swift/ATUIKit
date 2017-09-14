//
//  UIKitMacros.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import Foundation

// MARK: - 尺寸

/// 屏幕宽度
public let ScreenWidth = ScreenSize.width

/// 屏幕高度
public let ScreenHeight = ScreenSize.height

/// 屏幕尺寸
public let ScreenSize = ScreenBounds.size

// 屏幕frame
public let ScreenBounds = UIScreen.main.bounds


/// 导航栏高度
public let NavagationBarHeight = 64.0 as CGFloat

public let Pix = 1.0 / UIScreen.main.scale

/// 基于 iPhone 6 的尺寸的适配函数
///
/// - Parameter value: 基于 iPhone 6 的尺寸的值
/// - Returns: 对应不同屏幕得到的值
public func F6(_ value:Float) -> CGFloat {
    let result : CGFloat = (CGFloat)(value / 375.0) * ScreenWidth
    return result
}

// MARK: - 字体
/// 适配字体通用函数
///
/// - Parameters:
///   - size: 基于 iPhone 6 的尺寸的字体大小
///   - bold: 是否显示粗体，默认false，可不传
/// - Returns: 适配后的字体
public func FitFont(ofSize size:Float,bold:Bool = false) -> UIFont {
    if !bold {
        return UIFont.systemFont(ofSize: size.fit6)
    } else {
        return UIFont.boldSystemFont(ofSize: size.fit6)
    }
}

/// 字体通用函数
///
/// - Parameters:
///   - size: 体大小
///   - bold: 是否显示粗体，默认false，可不传
/// - Returns: 字体
public func Font(ofSize size:Float,bold:Bool = false) -> UIFont {
    if !bold {
        return UIFont.systemFont(ofSize: CGFloat(size))
    } else {
        return UIFont.boldSystemFont(ofSize: CGFloat(size))
    }
}

// MARK: - 颜色

/// 颜色请使用UIColor extension
