//
//  AppSectionCollectionViewCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppSectionCollectionViewCell: UICollectionViewCell {

    var app: FeedResult? {
        
        didSet {
            appTitleLabel.text = app?.name
            
            companyLabel.text = app?.artistName
            
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        }
    }
    
    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var appTitleLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    
    @IBOutlet var getButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        appIconImageView.layer.cornerRadius = 8
        getButton.layer.cornerRadius = 16
    }

}
