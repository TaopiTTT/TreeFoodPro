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

public func getType(name: String) -> Species{
    let path = Bundle.main.path(forResource: "homeList", ofType: "json")
    // json转NSData
    let jsonData = NSData(contentsOfFile: path!)
    // 解析json
    let json = JSON(jsonData!)
    let data = JSONDeserializer<HomeData>.deserializeFrom(json: json["data"].description)!.dishes
    for item in data {
        for food in item.content {
            if food.name == name {
                return Species(rawValue: Species.RawValue(item.speciesName)) ?? Species.Breakfast
            }
        }
    }
    return Species.Breakfast
}
