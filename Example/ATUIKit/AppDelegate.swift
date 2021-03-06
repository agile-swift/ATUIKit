//
//  AppDelegate.swift
//  ATUIKit
//
//  Created by admin@makaiwen.com on 09/11/2017.
//  Copyright (c) 2017 admin@makaiwen.com. All rights reserved.
//

import UIKit
import ATUIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let vc1 = BViewController()
        let vc2 = ViewController()
        vc1.ATTabBarItem = TabBarItem.init(title: "测试", titleOnSelected: "测试", titleColor: UIColor.gray, titleColorOnSelected: UIColor.init(hex: 0x1296db), icon: UIImage.init(named: "home")!, iconOnSelected: UIImage.init(named: "home_sel")!)
        vc2.ATTabBarItem = TabBarItem.init(title: "测试", titleOnSelected: "测试", titleColor: UIColor.gray, titleColorOnSelected: UIColor.init(hex: 0x1296db), icon: UIImage.init(named: "home")!, iconOnSelected: UIImage.init(named: "home_sel")!)

        vc1.ATTabBarItem?.iconScale = 0.9.f
        vc1.ATTabBarItem?.titleIconMargin = 2.f
        vc2.ATTabBarItem?.iconScale = 0.9.f
        vc2.ATTabBarItem?.titleIconMargin = 2.f
        let tabbarVc = TabBarController.init(viewControllers: [vc1,vc2])

        window = UIWindow(frame: CGRect(origin: CGPoint.zero, size: ScreenSize))
        
        let nav = NavigationController(rootViewController: tabbarVc)
        
        window?.rootViewController = nav

        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            tabbarVc.selectViewControllerAtIndex(index: 1)
            tabbarVc.setBadge("20", atIndex: 1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                //            tabbarVc.selectViewControllerAtIndex(index: 1)
                tabbarVc.setBadge("200", atIndex: 1)
                tabbarVc.setBadge("2", atIndex: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //            tabbarVc.selectViewControllerAtIndex(index: 1)
                    tabbarVc.setBadge(nil, atIndex: 1)
                    tabbarVc.setBadge("", atIndex: 0)
                }
            }
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

