//
//  TabBarController.swift
//  ATUIKit
//
//  Created by 凯文马 on 2017/10/19.
//

import UIKit

@objc public protocol TabBarControllerDelegate {
    @objc optional func tabBarController(_ tabBarController: TabBarController,didSelectItemAt index: Int) -> ()
    @objc optional func tabBarController(_ tabBarController: TabBarController,shouldSelectItemAt index: Int) -> Bool
}

open class TabBarController: UIViewController,TabBarDelegate {

    // MARK: 构造部分

    public init(viewControllers: [UIViewController],selectedIndex:UInt = 0) {
        _viewControllers = viewControllers
        _selectedIndex = Int(selectedIndex)
        super.init(nibName:nil,bundle:nil)
        // 获取item
        var items : [TabBarItem] = []
        for (_,vc) in _viewControllers.enumerated() {
            assert(vc.ATTabBarItem != nil, "请先为子控制器设置ATTabBar变量值")
            self.addChildViewController(vc)
            let item = vc.ATTabBarItem!
            items.append(item)
        }
        _tabBar = TabBar.init(frame: CGRect.init(x: 0, y: view.height - TabBarHeight, width: view.width, height: TabBarHeight), items: items, delegate: self, selectIndex: UInt(_selectedIndex))
        _tabBar?.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        view.addSubview(_tabBar!)
    }

    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: 公有部分
    open var delegate : TabBarControllerDelegate?
    
    open var tabBar : TabBar? {
        return _tabBar
    }
    
    open var selectedIndex : UInt {
        return UInt(_selectedIndex)
    }
    
    open var selectedViewController : UIViewController {
        return _viewControllers[_selectedIndex]
    }
    
    open func selectViewControllerAtIndex(index : UInt) -> ()
    {
        self.tabBar?.selectItemAtIndex(index: index)
    }
    
    open func setBadge(_ value:String?,atIndex index:UInt) {
        self.tabBar?.setBadge(value,atIndex:index)
    }
    
    open func badgeAtIndex(_ index:UInt) -> String? {
        return self.tabBar?.badgeAtIndex(index)
    }
    
    // MARK: 私有部分
    private var _viewControllers : [UIViewController]
    
    private var _selectedIndex : Int
    
    private var _tabBar : TabBar?
    
    // MARK: 重载部分

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        
    }

    public func tabBar(_ tabBar: TabBar, shouldSelectItemAt index: Int) -> Bool {
        return delegate?.tabBarController?(self, shouldSelectItemAt: index) ?? true
    }
    
    public func tabBar(_ tabBar: TabBar, didSelectItemAt index: Int) {
        // 移除
        self.childViewControllers[_selectedIndex].view.removeFromSuperview()
        // 添加
        let vcView = self.childViewControllers[index].view
        self.view.insertSubview(vcView!, belowSubview: tabBar)
        _selectedIndex = index
        delegate?.tabBarController?(self, didSelectItemAt: index)
    }
}

