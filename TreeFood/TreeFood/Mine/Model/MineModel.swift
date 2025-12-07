//
//  MineModel.swift
//  TreeFood
//
//  Created by Tao on 2025/12/7.
//

import Foundation
import HandyJSON

struct MineModel: HandyJSON {
    var backgroundImage = ""
    var userImage = ""
    var userName = ""
    var sex = ""
    var weight = ""
    var height = ""
    var birthday = ""
}

public enum editType {
    case sex
    case height
    case date
    case weight
}
