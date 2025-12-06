//
//  AddMenu.swift
//  TreeFood
//
//  Created by Tao on 2025/12/6.
//

import DKCamera
import FanMenu
import HandyJSON
import Macaw
import SwiftyJSON
import UIKit

//扇形菜单设置
class AddMenu: NSObject {
    // 单例模式的私有静态实例变量
    private static var _sharedInstance: AddMenu?

    // 私有化初始化方法，确保外部无法直接实例化
    override private init() {}

    // 提供全局访问点（单例方法）
    class func getsharedInstance() -> AddMenu {
        guard let instance = _sharedInstance else { //首次_sharedInstance是没有初始化的
            _sharedInstance = AddMenu() // 首次调用时创建实例
            return _sharedInstance!
        }
        return instance
    }

    // 懒加载的扇形菜单属性
    public lazy var fanMenu: FanMenu = {
        let fanMenu = FanMenu()
        // 菜单项配置：名称和颜色（白色）
        let items = [
            ("早餐", 0xFFFFFF),
            ("午餐", 0xFFFFFF),
            ("晚餐", 0xFFFFFF),
            ("小食", 0xFFFFFF),
        ]

        // 主按钮配置
        fanMenu.button = FanMenuButton(
            id: "main",
            image: UIImage(named: "menu_plus"), // 使用图片"menu_plus"
            color: Color(val: 0xF57555) // 主按钮颜色（橙色）
        )

        // 子按钮配置：将items映射为FanMenuButton数组
        fanMenu.items = items.map { button in
            FanMenuButton(
                id: button.0, // 按钮ID（如"早餐"）
                image: UIImage(named: "\(button.0)"), // 使用对应名称的图片
                color: Color(val: button.1) // 按钮颜色（白色）
            )
        }

        // 菜单布局参数
        fanMenu.menuRadius = 120.0 // 子按钮分布半径
        fanMenu.duration = 0.2 // 动画时长
        fanMenu.interval = (Double.pi + Double.pi / 6, Double.pi + 5 * Double.pi / 6) // 子按钮角度范围
        fanMenu.radius = 25.0 // 子按钮大小半径
        fanMenu.delay = 0.0 // 动画延迟
        fanMenu.backgroundColor = .clear // 背景透明
        return fanMenu
    }()
}
