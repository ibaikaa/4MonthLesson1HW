//
//  CustomActionCollectionViewCell.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 26/12/22.
//

import UIKit

class CustomServiceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var actionNameLabel: UILabel!
    
    @IBOutlet weak var actionIconImageView: UIImageView!
    
    public static let reuseId = String(describing: CustomServiceCollectionViewCell.self)
    
    
    public func configure(serviceName: String, serviceIcon: UIImage, _ isServiceActive: Bool) {
        actionNameLabel.text = serviceName
        actionIconImageView.image = serviceIcon
        
        if isServiceActive {
            actionNameLabel.textColor = .white
            actionIconImageView.tintColor = .white
        } else {
            actionNameLabel.textColor = nonActiveServiceTextColor
            actionIconImageView.tintColor = nonActiveServiceTextColor
        }
    }
}
