//
//  BarContentView.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import ESTabBarController_swift
import UIKit
import SnapKit

class BarContentView:ESTabBarItemContentView {
    override init(frame:CGRect){
        super.init(frame: frame)
        // 设置按钮和图标未选中与选中的颜色
        textColor = UIColor(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor(red: 96 / 255.0, green: 114 / 255.0, blue: 255 / 255.0, alpha: 1.0)
        iconColor = UIColor(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor(red: 0.98, green: 0.59, blue: 0.48, alpha: 1)
    }
    
    // 避开中部大按钮，手动偏移图标
    convenience init(frame: CGRect, postion: String) {
        self.init(frame: frame)
        if postion == "left" {
            insets = UIEdgeInsets(top: 30.fit, left: 0, bottom: 0, right: 20.fit)
        } else if postion == "right" {
            insets = UIEdgeInsets(top: 30.fit, left: 0, bottom: 0, right: -20.fit)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
