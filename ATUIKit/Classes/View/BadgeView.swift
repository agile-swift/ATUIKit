//
//  BadgeView.swift
//  ATUIKit
//
//  Created by 凯文马 on 2017/10/23.
//

import UIKit

open class BadgeView: UILabel {
    
    open var baseCenter: CGPoint? {
        didSet {
            setNeedsLayout()
        }
    }
    
    open var value : String? {
        didSet {
            setValue(value: value)
        }
    }
    
    init(value:String?)
    {
        self.value = value
        super.init(frame: CGRect.zero)
        setupView()
        setValue(value: value)
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setValue(value:String?)
    {
        self.text = value
        self.isHidden = value == nil
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.red
        self.font = FitFont(ofSize: 10)
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.layer.masksToBounds = true
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        var needSize = super.sizeThatFits(size)
        let maxValue = max(needSize.width, needSize.height)
        needSize.width = maxValue + 6.fit6
        needSize.height = maxValue + 6.fit6
        return needSize
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.sizeToFit()
        self.layer.cornerRadius = self.height * 0.5
        if (baseCenter != nil) {
            self.center = baseCenter!
        }
    }
}
