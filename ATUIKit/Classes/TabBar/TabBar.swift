//
//  TabBar.swift
//  ATUIKit
//
//  Created by 凯文马 on 2017/10/19.
//

import UIKit

@objc public protocol TabBarDelegate {
    @objc optional func tabBar(_ tabBar: TabBar,didSelectItemAt index: Int) -> ()
    @objc optional func tabBar(_ tabBar: TabBar,shouldSelectItemAt index: Int) -> Bool
}

open class TabBar: UIView {

    public init(frame:CGRect,items:[TabBarItem],delegate:TabBarDelegate? = nil,selectIndex:UInt = 0) {
        self._items = items
        self.delegate = delegate
        self._selectedIndex = Int(selectIndex)
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    /* 公有部分 */
    
    open var delegate : TabBarDelegate?
    
    /// 获取当前选中的索引值
    open var selectedIndex : Int { return _selectedIndex }
    
    /// 是否开启毛玻璃效果
    public var blurNeedOpen : Bool {
        set {
            _blurView.isHidden = !newValue
        }
        get {
            return !_blurView.isHidden
        }
    }
    
    open var topLineColor : UIColor? {
        set {
            _line.backgroundColor = newValue
        }
        get {
            return _line.backgroundColor
        }
    }
    
    open func setBadge(_ value:String?,atIndex index:UInt) {
        let item = _items[Int(index)]
        item.setBadgeValue(value)
    }
    
    open func badgeAtIndex(_ index:UInt) -> String? {
        let item = _items[Int(index)]
        return item.badgeView.text
    }
    
    /// 选中某个item
    ///
    /// - Parameter index: item索引，如果索引超出预设将不起任何作用
    public func selectItemAtIndex(index:UInt) ->() {
        let i = Int(index)
        let should = self.delegate?.tabBar?(self, shouldSelectItemAt: i) ?? true
        if (should) {
            for (idx,item) in _items.enumerated() {
                item.isSelected = i == idx
            }
            _selectedIndex = i
            self.delegate?.tabBar?(self, didSelectItemAt: i)
        }
    }
    
    
    
    /* 私有部分 */
    /// 选中的索引
    private var _selectedIndex = 0
    
    /// 包含每个item
    private var _items : [TabBarItem]
    
    private let _contentView = UIView()
    
    private var _line = UIView()
    
    private var _blurView = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .light))
    
    private func setupView() -> () {
        
        self.addSubview(_blurView)
        
        addSubview(_contentView)
        _line.backgroundColor = topLineColor ?? UIColor.lightGray
        addSubview(_line)
        
        for (index,item) in _items.enumerated() {
            _contentView.addSubview(item)
            item.tag = index
            item.addTarget(self, action: #selector(itemDidClickAction(tap:)))
        }
        selectItemAtIndex(index: UInt(_selectedIndex))
    }

    @objc private func itemDidClickAction(tap:UITapGestureRecognizer) -> Void
    {
        let item = tap.view as! TabBarItem
        let index = item.tag
        selectItemAtIndex(index: UInt(index))
    }
    
    // MARK: 重载部分
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        _blurView.frame = self.bounds
        _contentView.frame = CGRect.init(x: 0, y: 0, width: self.width, height: TabBarHeightWOHIH)
        _line.frame = CGRect.init(x: 0, y: 0, width: self.width, height: 1.pix)
        if (_items.count != 0) {
            let itemWidth = self.width / _items.count.f
            var offset = 0.f
            for item in _items {
                item.frame = CGRect.init(x: offset, y: 0, width: itemWidth, height: _contentView.height)
                offset += itemWidth
            }
        }
    }
}
