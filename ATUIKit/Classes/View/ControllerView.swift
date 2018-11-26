//
//  ControllerView.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

class ControllerView: UIView {

    public var navigationBar : NavigationBar? {
        if (_navigationBar.superview == nil) {
            return nil
        }
        return _navigationBar
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private let _navigationBar = NavigationBar()
    
    private func setupView() {
        self.backgroundColor = UIColor.white
    }
    
    open func addNavigationBar() {
        addSubview(_navigationBar)
    }
    
    open func removeNavigationBar() {
        _navigationBar.removeFromSuperview()
    }
    
    override func insertSubview(_ view: UIView, at index: Int) {
        super.insertSubview(view, at: index)
        if self.navigationBar != nil {
            self.bringSubviewToFront(_navigationBar)
        }
        fixTableView(view: view)
    }

    override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
        super.insertSubview(view, aboveSubview: siblingSubview)
        if self.navigationBar != nil {
            self.bringSubviewToFront(_navigationBar)
        }
        fixTableView(view: view)
    }
    
    override func addSubview(_ view: UIView) {
        if (self.navigationBar == nil) {
            super.addSubview(view)
        } else {
            super.insertSubview(view, belowSubview: _navigationBar)
        }
        fixTableView(view: view)
    }
    
    private func fixTableView(view:UIView) {
        if let tableView = view as? UITableView {
            if #available(iOS 11.0, *) {
                tableView.contentInsetAdjustmentBehavior = .never
                tableView.scrollIndicatorInsets = tableView.contentInset
            }
        }
    }
}
