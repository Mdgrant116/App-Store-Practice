//
//  SearchCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/20/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    var app: Result! {
        
        didSet {
            
            appTitleLabel.text = app.trackName
            appCategoryLabel.text = app.primaryGenreName
            appRatingsLabel.text = "Rating: \(app.averageUserRating ?? 0)"
            
            let url = URL(string: app.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            screenshotImageView1.sd_setImage(with: URL(string: app.screenshotUrls[0]))
            
            if app.screenshotUrls.count > 1 {
                
                screenshotImageView2.sd_setImage(with: URL(string: app.screenshotUrls[1]))
                
            }
            
            if app.screenshotUrls.count > 2 {
                
                screenshotImageView3.sd_setImage(with: URL(string: app.screenshotUrls[2]))
            }
            
        }
        
    }
    
    @IBOutlet var appIconImageView: UIImageView!
    @IBOutlet var getButton: UIButton!
    @IBOutlet var appTitleLabel: UILabel!
    
    @IBOutlet var appRatingsLabel: UILabel!
    @IBOutlet var appCategoryLabel: UILabel!
    
    @IBOutlet var screenshotImageView1: UIImageView!
    
    @IBOutlet var screenshotImageView2: UIImageView!
    
    @IBOutlet var screenshotImageView3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appIconImageView.layer.cornerRadius = 12
        getButton.layer.cornerRadius = 16
        screenshotImageView1.layer.cornerRadius = 8
        screenshotImageView2.layer.cornerRadius = 8
        screenshotImageView3.layer.cornerRadius = 8
        
        
    }
    
}
