//
//  ViewController.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/20/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    var appResults = [Result]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        fetchItunesApps()
        
    }
    
    
    func fetchItunesApps() {
        
        Service.shared.fetchApps { (results) in
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                
            }
            
        }
        
        
    }
    
    
}




//MARK: - CollectionView

extension SearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchCell
        
        let app = appResults[indexPath.item]
        cell.appTitleLabel.text = app.trackName
        cell.appCategoryLabel.text = app.primaryGenreName
        cell.appRatingsLabel.text = "Rating: \(app.averageUserRating ?? 0)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 350)
        
    }
}

