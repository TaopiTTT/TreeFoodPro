//
//  AddModel.swift
//  TreeFood
//
//  Created by Tao on 2025/12/6.
//

import Foundation
import HandyJSON

// MARK: - DataClass
struct AddModel: HandyJSON {
    let eats = [AddFood]()
}


// MARK: - AddFood
struct AddFood: HandyJSON {
    var categoryName = ""
    var content = [Ingredient]()
}
// MARK: -背包食材
struct BagFood {
    let name:String
    let caloris:Int
}
