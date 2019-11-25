//
//  AppsViewController.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/20/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController {
    
    var  groups = [AppGroup]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Apps"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "AppSectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.register(UINib(nibName: "AppsHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        fetchData()
        
    }
    
    func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        Service.shared.fetchTopGrossing { (appGroup, error) in
            
            dispatchGroup.leave()
            group1 = appGroup
            
        }
        
        dispatchGroup.enter()
        
        Service.shared.fetchNewAppsWeLove { (appGroup, error) in
            
            dispatchGroup.leave()
            group2 = appGroup
            
        }
        
        dispatchGroup.enter()
        
        Service.shared.fetchGames { (appGroup, error) in
            
            dispatchGroup.leave()
            group3 = appGroup
            
        }
        
        dispatchGroup.notify(queue: .main) {
            
            if let group = group1 {
                
                self.groups.append(group)
                
            }
            if let group = group2 {
                
                self.groups.append(group)
                
            }
            if let group = group3 {
                
                self.groups.append(group)
                
            }
            
            self.collectionView.reloadData()
            
        }
        
    }
    
}



extension AppsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return groups.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AppSectionCell
        
        let appGroup = groups[indexPath.item]
        
        
        cell.titleLabel.text = appGroup.feed.title
        cell.appSectionDataSource.appGroup = appGroup
        cell.collectionView.reloadData()
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
