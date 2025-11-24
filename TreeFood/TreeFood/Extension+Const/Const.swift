//
//  Const.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import Foundation
import UIKit

let CFWidth = UIScreen.main.bounds.width
let CFHeight = UIScreen.main.bounds.height

// iphone X
let isIphoneX = CFHeight >= 812 ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = isIphoneX ? 88 : 64
// tabBarHeight
let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49


/*状态栏高度*/
let kStatusBarHeight: CGFloat = isIphoneX ? 44.0 : 20.0
/*导航栏高度*/
let kNavBarHeight: CGFloat = 44
