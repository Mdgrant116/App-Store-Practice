//
//  AppSectionCell.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppSectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let appSectionDataSource = AppSectionCollectionViewDataSource()
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = appSectionDataSource
        collectionView.delegate = appSectionDataSource
        collectionView.register(UINib(nibName: "AppSectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        
    }
    
    
}
