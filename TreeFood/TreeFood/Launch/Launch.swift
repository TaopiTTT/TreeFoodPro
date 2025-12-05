//
//  Launch.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import Foundation
import ESTabBarController_swift
import UIKit

func Launch() -> ESTabBarController {
    let tabBarController = ESTabBarController()
    let homeVC = HomeViewController()
    let recordVC = RecordViewController()
    let mineVC = MineViewController()
    let analyzeVC = AnalyzeViewController()
    let addVC = UIViewController()
    
    homeVC.tabBarItem = ESTabBarItem.init(BarContentView(frame: .zero, postion: "left"), title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
    recordVC.tabBarItem = ESTabBarItem.init(BarContentView(frame: .zero, postion: "left"), title: "", image: UIImage(named: "recoder"), selectedImage: UIImage(named: "recoder"))
    mineVC.tabBarItem = ESTabBarItem.init(BarContentView(frame: .zero, postion: "right"), title: "", image: UIImage(named: "mine"), selectedImage: UIImage(named: "mine"))
    analyzeVC.tabBarItem = ESTabBarItem.init(BarContentView(frame: .zero, postion: "right"), title: "", image: UIImage(named: "archive"), selectedImage: UIImage(named: "archive"))
    addVC.tabBarItem = ESTabBarItem.init(BarContentView(frame: .zero, postion: "right"), title: "", image: UIImage(), selectedImage: UIImage())
    
    let homeNavi = BaseNavigationController(rootViewController: homeVC)
    let recordNavi = BaseNavigationController(rootViewController: recordVC)
    let mineNavi = BaseNavigationController(rootViewController: mineVC)
    let analyzeNavi = BaseNavigationController(rootViewController: analyzeVC)
    let addNavi = BaseNavigationController(rootViewController: addVC)
    
    tabBarController.viewControllers = [homeNavi, recordNavi, addNavi, analyzeNavi, mineNavi]
//    , recordNavi, addNavi, analyzeNavi, mineNavi
    
    UITabBar.appearance().isTranslucent = false
    //选项卡是否半透明，当标签栏为半透明时，配置视图控制器的 edgesForExtendedLayout 和 extendedLayoutIncludesOpaqueBars 属性以在标签栏下方显示您的内容。
//    如果标签栏没有自定义背景图像，或者背景图像的任何像素的 alpha 值小于 1.0，则此属性的默认值为 true。如果背景图像完全不透明，则此属性的默认值为 false。如果您将此属性设置为 true 并且自定义背景图像完全不透明，则 UIKit 将小于 1.0 的系统定义不透明度应用于图像。如果将此属性设置为 false 并且背景图像不是不透明的，UIKit 会添加一个不透明的背景。
    UITabBar.appearance().tintColor = .white
    tabBarController.tabBar.barStyle = .default
    tabBarController.tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBarController.tabBar.layer.shadowOffset = CGSize(width: 0, height: -3.fit)
    tabBarController.tabBar.layer.shadowOpacity = 0.2
    tabBarController.tabBar.backgroundColor = .white
    tabBarController.tabBar.shadowImage = UIImage(named: "background")
    tabBarController.tabBar.barTintColor = UIColor.red
    tabBarController.tabBar.backgroundImage = UIImage(named: "background")

    
    return tabBarController
}
