//
//  StoreCustomTableViewCell.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 30/12/22.
//

import UIKit


class StoreCustomTableViewCell: UITableViewCell {
    public static var reuseID = String(describing: StoreCustomTableViewCell.self)
    
    
    @IBOutlet private weak var storePictureImageView: UIImageView!
    
    @IBOutlet private weak var storeNameLabel: UILabel!
    
    @IBOutlet private weak var storeWorkStateLabel: UILabel!
    
    @IBOutlet private weak var deliveryTimeLabel: UILabel!
    
    @IBOutlet private weak var averageCafeRateLabel: UILabel!
    
    @IBOutlet private weak var reviewsQuantityLabel: UILabel!
    
    @IBOutlet private weak var kitchenTypeNationalityLabel: UILabel!
    
    @IBOutlet private weak var specialFoodForCafeLabel: UILabel!
    
    @IBOutlet private weak var deliveryCostLabel: UILabel!
    
    @IBOutlet private weak var minimalReceiptCostLabel: UILabel!
    
    @IBOutlet private weak var currentDistanceFromUserLabel: UILabel!
    
    
    public func configureCellBeforeShowing(store: StoreModel) {
        storePictureImageView.image = store.storePicture
        storeNameLabel.text = store.storeName
        storeWorkStateLabel.text = store.storeOpened ? "• OPEN" : "• CLOSED"
        storeWorkStateLabel.textColor = store.storeOpened ? .green : .red
        deliveryTimeLabel.text = "\(store.deliveryTime.min) - \(store.deliveryTime.max) min"
        averageCafeRateLabel.text = "\(round(store.averageCafeRate * 10) / 10.0 )"
        reviewsQuantityLabel.text = "(\(store.reviewsQuantity))"
        kitchenTypeNationalityLabel.text = "\(store.kitchenTypeNationality.rawValue.capitalizedSentence)"
        specialFoodForCafeLabel.text = "• \(store.specialCafeFood)"
        deliveryCostLabel.text = store.deliveryCost == nil ? "Delivery: FREE" : "Delivery: \(store.deliveryCost ?? 0)$"
        minimalReceiptCostLabel.text = "Minimum: $\(Int(store.minimalReceiptCost))"
        currentDistanceFromUserLabel.text = "\(round(store.currentDistanceFromUser * 10) / 10.0 ) km away"
        
    }
    
}

extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
