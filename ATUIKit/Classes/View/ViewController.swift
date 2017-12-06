//
//  ATViewController.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

public struct NavigationBarLeftStyle  {
    public var autoAddBackButton = true
    public var backImage : UIImage?
    public var closeImage : UIImage?
}

open class ViewController: UIViewController {

    public static var navigationBarLeftStyle = NavigationBarLeftStyle.init()
    
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
        addNavigationBar()
        if title != nil {
            navigationBar?.title = title!
        }
        if #available(iOS 11.0, *) {
            
        } else {
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
            (view as! ControllerView).navigationBar?.title = title ?? ""
        }
    }
    
    open func addNavigationBar() {
        (view as! ControllerView).addNavigationBar()
        if ViewController.navigationBarLeftStyle.autoAddBackButton && navigationController != nil && navigationController?.viewControllers.count ?? 0 > 1 {
            addBackButton()
        }
    }
    
    open func removeNavigationBar() {
        (view as! ControllerView).removeNavigationBar()
    }
    
    open func addBackButtonWithImage(image : UIImage?) -> UIButton {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        btn.addTarget(self, action: #selector(goBack))
        btn.sizeToFit()
        self.navigationBar?.leftItem = btn
        return btn
    }
    
    open func addCloseButtonWithImage(image : UIImage?) -> UIButton {
        let btn = UIButton()
        btn.setImage(image, for: .normal)
        btn.addTarget(self, action: #selector(close))
        btn.sizeToFit()
        self.navigationBar?.leftItem = btn
        return btn
    }
    
    open func addBackButton() {
        _ = addBackButtonWithImage(image: ViewController.navigationBarLeftStyle.backImage)
    }
    
    open func addCloseButton() {
        _ = addCloseButtonWithImage(image: ViewController.navigationBarLeftStyle.closeImage)
    }
    
    @objc open func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc open func close() {
        if self.navigationController != nil {
            self.navigationController?.dismiss(animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
