//
//  Extension.swift
//  TreeFood
//
//  Created by Tao on 2025/11/23.
//

import EachNavigationBar
import Foundation
import UIKit
import SwiftyJSON
import HandyJSON

extension Double {
    var fit: CGFloat {
        return CGFloat(self / 414.0) * UIScreen.main.bounds.width
    }

    var fitW: CGFloat {
        return CGFloat(self / 414.0) * UIScreen.main.bounds.width
    }

    var fitH: CGFloat {
        return CGFloat(self / 896.0) * UIScreen.main.bounds.width
    }
}
