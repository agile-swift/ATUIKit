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
        addSubview(_navigationBar)
    }
    
    override func insertSubview(_ view: UIView, at index: Int) {
        if index != 0 {
            super.insertSubview(view, at: index)
        } else {
            super.insertSubview(view, at: 1)
        }
    }

    override func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) {
        if siblingSubview != _navigationBar {
            super.insertSubview(view, belowSubview: siblingSubview)
        } else {
            super.insertSubview(view, aboveSubview: siblingSubview)
        }
    }
}
