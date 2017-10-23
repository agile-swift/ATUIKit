//
//  NavigationBar.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

fileprivate let DefaultFrame = CGRect(x: 0, y: 0, width: ScreenWidth, height: NavagationBarHeight)

fileprivate var DefaultTitleFont = FitFont(ofSize: 17, bold: true)

fileprivate var DefaultTitleColor = UIColor.black

fileprivate var DefaultBottomLineColor : UIColor? = UIColor.lightGray

fileprivate let NavigationTitleWidth = ScreenWidth * 0.5

open class NavigationBar: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: DefaultFrame)
        setupView()
    }
    
    
    /// 默认字体，字号最大为32号
    open class var defaultTitleFont : UIFont {
        set {
            if newValue.pointSize > 32 {
                return
            }
            DefaultTitleFont = newValue
        }
        get {
            return DefaultTitleFont
        }
    }
    
    open class var defaultTitleColor : UIColor {
        set {
            DefaultTitleColor = newValue
        }
        get {
            return DefaultTitleColor
        }
    }
    
    open class var defaultBottomLineColor : UIColor? {
        set {
            DefaultBottomLineColor = newValue
        }
        get {
            return DefaultBottomLineColor
        }
    }
    
    // MARK: - 公有
    
    
    /// 需要自定义视图请添加到contentView上面
    open var contentView : UIView = UIView()

    // MARK: 标题
    
    /// 字体颜色，设置标题之前有效
    open var titleColor : UIColor?
    
    /// 字体，设置标题之前有效
    open var titleFont : UIFont?
    
    /// 自定义标题
    open var titleView : UIView?
    
    
    /// 标题
    open var title : String {
        set {
            let font = titleFont ?? DefaultTitleFont
            let color = titleColor ?? DefaultTitleColor
            attributedTitle = NSAttributedString.init(string: newValue, attributes: [NSForegroundColorAttributeName : color,NSFontAttributeName : font])
        }
        get {
            return attributedTitle.string
        }
        
    }

    open var attributedTitle : NSAttributedString = NSAttributedString(){
        didSet {
            _titleLabel?.attributedText = attributedTitle
        }
    }
    
    open var bottomBorderColor : UIColor? {
        get {
            return _bottomLine.backgroundColor
        }
        set {
            _bottomLine.backgroundColor = newValue
        }
    }

    open var leftItem : UIView? {
        get {
            return _leftItems.first
        }
        set {
            if newValue != nil {
                leftItems = [newValue!]
            }
        }
    }
    
    open var rightItem : UIView?{
        get {
            return _rightItems.first
        }
        set {
            if newValue != nil {
                rightItems = [newValue!]
            }
        }
    }
    
    open var rightItems : [UIView] {
        get {
            return _rightItems
        }
        set {
            let r = _rightItems
            _rightItems = newValue
            updateItems(r)
        }
    }
    
    open var leftItems : [UIView] {
        get {
            return _leftItems
        }
        set {
            let r = _leftItems
            _leftItems = newValue
            updateItems(r)
        }
    }
    
    // MARK: - 私有

    private var _titleLabel : UILabel?
    
    private var _leftItems : [UIView] = []
    
    private var _rightItems : [UIView] = []
    
    private lazy var _bottomLine : UIView = {
        [unowned self] in
        let line = UIView()
        self.addSubview(line)
        return line
    }()
    
    private func setupView() {
        
        addSubview(contentView)
        
        if _titleLabel == nil {
            _titleLabel = UILabel()
            _titleLabel?.font = Font(ofSize: 17,bold: true)
            addSubview(_titleLabel!)
        }
        if DefaultBottomLineColor != nil {
            _bottomLine.backgroundColor = DefaultBottomLineColor
        }
    }
    
    private func updateItems(_ removeItems : [UIView]) {
        for item in removeItems {
            item.removeFromSuperview()
        }
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    // MARK: - 重写
    open override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = self.bounds
        _titleLabel?.sizeToFit()
        let centerY = self.height * 0.5 + 10
        
        // 左侧
        var leftOffset = 15.fit6
        for item in _leftItems {
            if item.width == 0 || item.height == 0 {
                item.sizeToFit()
            }
            item.left = leftOffset
            item.centerY = centerY
            addSubview(item)
            leftOffset += 5.fit6 + item.width
        }
        
        // 右侧
        var rightOffset = ScreenWidth - 15.fit6
        for item in _rightItems {
            if item.width == 0 || item.height == 0 {
                item.sizeToFit()
            }
            item.right = rightOffset
            item.centerY = centerY
            addSubview(item)
            rightOffset -= 5.fit6 + item.width
        }
        
        let titleNeedWidth = _titleLabel?.width ?? 0
        let leftLeft = self.width * 0.5 - leftOffset
        let rightLeft = rightOffset - self.width * 0.5
        
        
        var minValue = min(leftLeft,rightLeft)
        minValue = max(minValue, 0)
        
        _titleLabel?.width = min(minValue * 2, titleNeedWidth)
        _titleLabel?.center = CGPoint.init(x: width * 0.5, y: centerY)

        _bottomLine.frame = CGRect(x: 0, y: height - 1.pix, width: width, height: 1.pix)
    }
}
