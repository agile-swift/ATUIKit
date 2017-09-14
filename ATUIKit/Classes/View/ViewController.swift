//
//  ATViewController.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

open class ViewController: UIViewController {

    
    /// 获取导航栏，会强制加载View
    open var navigationBar : NavigationBar? {
        get {
            if view is ControllerView {
                return (view as! ControllerView).navigationBar
            }
            return nil
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if title != nil {
            navigationBar?.title = title!
        }
        automaticallyAdjustsScrollViewInsets = false
    }

    open override func loadView() {
        view = ControllerView(frame: ScreenBounds)
    }
    
    open override var title: String? {
        didSet {
            guard let view = self.viewIfLoaded else {
                return
            }
            (view as! ControllerView).navigationBar.title = title ?? ""
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
