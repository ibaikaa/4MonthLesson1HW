//
//  StoreModel.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 30/12/22.
//

import UIKit

struct StoreModel {
    let storePicture: UIImage
    let storeName: String
    var storeOpened: Bool
    let deliveryTime: (min: Int, max: Int)
    var averageCafeRate: Double
    var reviewsQuantity: Int
    let kitchenTypeNationality: KitchenNationality
    let specialCafeFood: String
    let deliveryCost: Int?
    let minimalReceiptCost: Double
    let currentDistanceFromUser: Float
    
}


enum KitchenNationality: String {
    case american = "american", italian = "italian", asian = "asian", kyrgyz = "kyrgyz", turkish = "turkish", french = "french"
}
