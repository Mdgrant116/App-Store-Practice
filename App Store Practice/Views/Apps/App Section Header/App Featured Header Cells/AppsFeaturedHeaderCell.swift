//
//  AppsFeaturedHeaderCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppsFeaturedHeaderCell: UICollectionViewCell {

    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var featuredImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        featuredImageView.layer.cornerRadius = 8
    }

}
