//
//  TabBarItem.swift
//  ATUIKit
//
//  Created by 凯文马 on 2017/10/19.
//

import UIKit
import CoreGraphics

open class TabBarItem: UIControl {

    // MARK: 构造
    
    public init(title: String,titleOnSelected stitle: String?,titleColor: UIColor,titleColorOnSelected stitleColor: UIColor,icon: UIImage,iconOnSelected sicon: UIImage) {
        self.title = title
        self.selectedTitle = stitle ?? title
        self.titleColor = titleColor
        self.selectedTitleColor = stitleColor
        self.icon = icon
        self.selectedIcon = sicon
        super.init(frame: .zero)
        self.didSetTitle()
        self.didSetSelectedTitle()
        self.didSetIcon()
        self.didSetSelectedIcon()
        self.didSetTitleColor()
        self.didSetSelectedTitleColor()
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: 公有部分

    open var title : String { didSet { didSetTitle() } }
    
    open var selectedTitle : String? { didSet { didSetSelectedTitle() } }
    
    open var titleColor : UIColor { didSet { didSetTitleColor() } }
    
    open var selectedTitleColor : UIColor { didSet { didSetSelectedTitleColor() } }
    
    open var icon : UIImage { didSet { didSetIcon() } }
    
    open var selectedIcon : UIImage { didSet { didSetSelectedIcon() } }

    open var titleIconMargin : CGFloat  = 5.f { didSet {layoutIfNeeded()} }
    
    open var iconScale : CGFloat = 1 { didSet {layoutIfNeeded() } }
    
    open let badgeView = BadgeView(value:nil)
    
    open func setBadgeValue(_ value:String?) {
        if (self.badgeView.superview == nil) {
            self.addSubview(self.badgeView)
        }
        self.badgeView.value = value
    }
    
    // MARK: 私有部分
    
    private lazy var titleView : UILabel = {
        [weak self] in
        var label = UILabel()
        label.font = FitFont(ofSize: 10)
        label.textAlignment = .center
        self?.addSubview(label)
        return label
    }()
    
    private lazy var imageView : UIImageView = {
        [weak self] in
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self?.addSubview(imageView)
        return imageView
    }()
    
    private func didSetTitle() -> () { if (!isSelected) { self.titleView.text = title } }
    
    private func didSetSelectedTitle() -> () { if isSelected { self.titleView.text = selectedTitle } }
    
    private func didSetTitleColor() -> () { if !isSelected { self.titleView.textColor = titleColor } }
    
    private func didSetSelectedTitleColor() -> () { if isSelected { self.titleView.textColor = selectedTitleColor } }
    
    private func didSetIcon() -> () { if !isSelected { self.imageView.image = icon } }
    
    private func didSetSelectedIcon() -> () { if isSelected { self.imageView.image = selectedIcon } }
    
    // MARK: 重载
    open override func layoutSubviews() {
        super.layoutSubviews()
        // 文字
        self.titleView.height = self.titleView.font.lineHeight
        self.titleView.width = self.width
        self.titleView.bottom = self.height - 2.fit6
        
        // 图标
        let image = self.imageView.image
        let size = image?.size ?? CGSize.zero
        self.imageView.frame = CGRect.init(x: 0, y:0 , width: size.width.fit6 * iconScale, height: size.height.fit6 * iconScale)
        self.imageView.centerX = self.width * 0.5.f
        self.imageView.bottom = self.titleView.top - titleIconMargin;
        
        badgeView.baseCenter = CGPoint.init(x: imageView.right, y: imageView.top + 5.f)

    }
    
    open override var isSelected: Bool {
        didSet {
            if isSelected {
                self.titleView.text = selectedTitle
                self.titleView.textColor = selectedTitleColor
                self.imageView.image = selectedIcon
            } else {
                self.titleView.text = title
                self.titleView.textColor = titleColor
                self.imageView.image = icon
            }
            
        }
    }
    
}

fileprivate let tabbarItemKey = UnsafeRawPointer.init(bitPattern:"tabbarItemKey".hashValue)

public extension UIViewController {
    
    public var ATTabBarItem : TabBarItem? {
        set {
            objc_setAssociatedObject(self, tabbarItemKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, tabbarItemKey) as? TabBarItem
        }
    }
}
