//
//  ViewController.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/20/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit
import SDWebImage


class SearchViewController: UIViewController {
    
    //MARK: - Properties
    
    var timer: Timer?
    var appResults = [Result]()
    let searchController = UISearchController()
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var searchMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seutpSearchBar()
        collectionView.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
    
    //MARK: - Functions
    
    func seutpSearchBar() {
        
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    func fetchItunesApps() {
        
        Service.shared.fetchApps(searchTerm: "Instagram") { (results) in
            
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
        
        searchMessageLabel.isHidden = appResults.count != 0
        
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchCell
        
        let app = appResults[indexPath.item]
        cell.app = app
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 350)
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // introduce some delay before performing the search, otherwise it searches and reloads with every letter you press
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res) in
                
                self.appResults = res
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                }
                
            }
            
        })
        
    }
    
}

