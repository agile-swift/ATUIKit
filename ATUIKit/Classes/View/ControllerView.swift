//
//  ControllerView.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit

class ControllerView: UIView {

    public var navigationBar : NavigationBar {
        return _navigationBar
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let _navigationBar = NavigationBar()
    
    private func setupView() {
        self.backgroundColor = UIColor.white
        addSubview(_navigationBar)
    }
    
    override func insertSubview(_ view: UIView, at index: Int) {
        super.insertSubview(view, at: index)
        self.bringSubview(toFront: navigationBar)
    }

    override func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) {
        super.insertSubview(view, aboveSubview: siblingSubview)
        self.bringSubview(toFront: navigationBar)
    }
    
    override func addSubview(_ view: UIView) {
        if (view == navigationBar) {
            super.addSubview(view)
        } else {
            super.insertSubview(view, belowSubview: navigationBar)
        }
    }
}
