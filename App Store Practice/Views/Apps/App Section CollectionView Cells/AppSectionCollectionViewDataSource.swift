//
//  AppSectionCollectionViewDataSource.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/24/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppSectionCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let topBottomPadding: CGFloat = 12
        let lineSpacing: CGFloat = 10
        let height = (collectionView.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3

        return CGSize(width: collectionView.frame.width, height: height)
        
    }

}
