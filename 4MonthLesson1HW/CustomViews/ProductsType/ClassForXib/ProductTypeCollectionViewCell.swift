//
//  ProductTypeCollectionViewCell.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 26/12/22.
//

import UIKit

class ProductTypeCollectionViewCell: UICollectionViewCell {
    
    public static var reuseID = String(describing: ProductTypeCollectionViewCell.self)
    
    
    @IBOutlet private weak var productTypeImageView: UIImageView!
    
    
    @IBOutlet weak var productTypeNameLabel: UILabel!
    
    
    public func configure(productTypeName: String, icon: UIImage) {
        productTypeNameLabel.text = productTypeName
        productTypeImageView.image = icon
    }

}
