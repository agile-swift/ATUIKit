
//
//  NavigationController.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import Foundation

open class NavigationController: UINavigationController {
    
    
    /// 获取当前导航控制器
    open class var current : NavigationController? {
        guard let window = UIApplication.shared.delegate?.window,
        let rootVc = window?.rootViewController  else {
            return nil
        }
        var currentViewController : UIViewController? = rootVc
        if currentViewController is UITabBarController {
            currentViewController = (currentViewController as! UITabBarController).selectedViewController
        }
        if currentViewController == nil {
            return nil
        }
        while currentViewController?.presentedViewController != nil {
            currentViewController = currentViewController?.presentedViewController
        }
        if currentViewController is NavigationController {
            return currentViewController as? NavigationController
        }
        if currentViewController?.navigationController != nil {
            return currentViewController?.navigationController as? NavigationController
        }
        return nil
    }
    
    fileprivate var currentViewController : UIViewController?
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
        isNavigationBarHidden = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if topViewController != nil {
            return topViewController!.preferredStatusBarStyle
        }
        return super.preferredStatusBarStyle
    }
}


extension NavigationController : UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            return self.currentViewController == topViewController
        }
        return true
    }
}

extension NavigationController : UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        currentViewController = navigationController.viewControllers.count == 1 ? nil : viewController
    }

}

