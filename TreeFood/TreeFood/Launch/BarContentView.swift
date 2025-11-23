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
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        bounceAnimation()
        completion?()
    }
    
    // 模拟弹簧效果
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = 0.3 * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

// 解决穿透点击bug
extension ESTabBar {
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 1. 如果 TabBar 隐藏或不可交互，则不处理
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        // 2. 尝试默认的点击检测
        let resultView = super.hitTest(point, with: event)
        if resultView != nil {
            return resultView
        } else {
            // 3. 关键逻辑：如果点击点在 TabBar 范围之外（resultView 为 nil）
            // 遍历所有子视图（例如那个凸起的中间大按钮）
            for subView in subviews.reversed() {
                let convertPoint: CGPoint = subView.convert(point, from: self)
                let hitView = subView.hitTest(convertPoint, with: event)
                if hitView != nil {
                    return hitView
                }
            }
        }
        return nil
    }
}
