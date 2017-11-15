//
//  ViewController.swift
//  ATUIKit
//
//  Created by makw@hui10.com on 09/11/2017.
//  Copyright (c) 2017 makw@hui10.com. All rights reserved.
//

import UIKit
import ATUIKit

class ViewController: ATUIKit.ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBar.defaultBottomLineColor = UIColor.red
        
        view.addTarget(self, action: #selector(btnClick))
        
        navTest()
        imageTest()
    }

    @objc func btnClick() {
        print("按钮点击了")
    }
    
    func navTest() {
        // 测试导航底线颜色
        self.navigationBar?.bottomBorderColor = UIColor.random
        
        // 测试标题
        self.title = "苹果公司 iPhone X 上市"
        NavigationBar.defaultTitleFont = Font(ofSize: 132, bold: true)
//        self.navigationBar?.titleFont = Font(ofSize: 132, bold: true)

        
    }
    
    func imageTest() {
        let imageView = UIImageView()
        let image = UIImage.init(color: UIColor.random)
        
        imageView.image = image.imageScaleToSize(CGSize.init(width: 100, height: 100), option: .circleBorder(width: 4, color: UIColor.random))
        view.addSubview(imageView)
        imageView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        imageView.center = view.center
    }
    
}

