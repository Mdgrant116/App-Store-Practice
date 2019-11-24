//
//  AppsHeaderCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionReusableView {

    let appHeaderDataSource = AppsHeaderCollectionViewDataSource()
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = appHeaderDataSource
        collectionView.delegate = appHeaderDataSource
        collectionView.register(UINib(nibName: "AppsFeaturedHeaderCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        // Initialization code
    }
    
}
