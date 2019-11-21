//
//  SearchCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/20/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {

    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var getButton: UIButton!
    @IBOutlet var appTitleLabel: UILabel!
    
    @IBOutlet var appRatingsLabel: UILabel!
    @IBOutlet var appCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        appIconImageView.layer.cornerRadius = 12
        getButton.layer.cornerRadius = 16
        backgroundColor = .blue
    }

}
