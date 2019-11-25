//
//  Service.swift
//  App Store Practice
//
//  Created by Michael Grant on 11/21/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result]) ->()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                
                print("Failed to fetch apps:", err)
                
                return
            }
            
            let decoder = JSONDecoder()
            guard let data = data else { return }
            do {
                
                let decodedData = try decoder.decode(SearchResult.self, from: data)
                
                completion(decodedData.results)
                
            } catch {
                
                print("Failed to decode JSON", error)
                
            }
            
        }.resume()
        
    }
    
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let error = error {
                
                completion(nil, error)
                
                print("Error fetching data from url")
                return
            }
            
                do {
                
                    guard let safeData = data else { return }
                    
                    let decoder = JSONDecoder()
                    let appGroup = try decoder.decode(AppGroup.self, from: safeData)
                    
                    
                    completion(appGroup, nil)
                    
                    } catch {
                        
                        completion(nil, error)
                        
            }
                    
            
        }.resume()
        
        
    }
    
    
}

