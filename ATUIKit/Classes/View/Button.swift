//
//  ATButton.swift
//  Pods
//
//  Created by 凯文马 on 2017/9/11.
//
//

import UIKit



open class Button: UIButton {
    
    public convenience init(withTitle title:String?,titleColor:UIColor?,titleFont:UIFont?,background:Background?, click:(()->())?) {
        self.init(frame: CGRect())
        self.action = click
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setTitleColor(titleColor?.withAlphaComponent(0.4), for: .highlighted)
        self.addTarget(self, action: #selector(_clickAction), for: .touchUpInside)
        titleFont != nil ? self.titleLabel?.font = titleFont! : ()
        if let bgImage : UIImage = background as? UIImage {
            self.setBackgroundImage(bgImage, for: .normal)
        } else if let bgColor : UIColor = background as? UIColor {
            self.setBackgroundImage(UIImage(color: bgColor), for: .normal)
            self.setBackgroundImage(UIImage(color: bgColor.withAlphaComponent(0.4)), for: .normal)
        }
        self.sizeToFit()
    }
    
    private var action : (()->())?
    
    @objc private func _clickAction() {
        self.action?()
    }

    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        var s = super.sizeThatFits(size)
        s.width += 20.fit6
        s.height += 10.fit6
        return s
    }
}

