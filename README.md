## **Initial Apps Controller JSON Fetch**

### 1. Construct the URL

    guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }

### 2. Create a URLSession.shared.dataTask with the url you just constructed with a completion handler.

    URLSession.shared.dataTask(with: url) { (data, response, error) in
            
        }


### Optional 

Print the data you’re receiving just to make sure you’re getting something, and don’t forget to use  .resume on the task.

    URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            print(data)
            
    }.resume()


If you want to take the optional step further,  you can convert the data to a string to see exactly what the JSON you’re getting back is.

    URLSession.shared.dataTask(with: url) { (data, response, error) in
          
            print(String(data: data!, encoding: .utf8))

    }.resume()

### 3. Take care of your error handling to cover your tracks and always make sure you know at what step in the process things broke down. 

    URLSession.shared.dataTask(with: url) { (data, response, error) in


            if let error = error {
                
                print("Error fetching data from url")
                return

            }
            
         
        }.resume()
        
        
    }

### 4. Create a model object that reflects the data structure of what you’re trying to receive. Make sure its set to codable, and make sure all of the properties are spelled the exact same way as they are in the JSON data.

    struct AppGroup: Codable {
    
        let feed: Feed
    
    }

    struct Feed: Codable {
    
        let title: String
        let results: [FeedResult]
    
    }

    struct FeedResult: Codable {
    
        let artistName: String
        let name: String
        let artworkUrl100: String
    
    }


### 5. Create an instance of JSONDecoder, and decode the JSON you hopefully just confirmed you’re receiving. The decoding type is the struct you just created that reflects the data structure of the JSON you’re receiving. Before you can set the from: you have to safely unwrap the data. Here comes the annoying part. You have to wrap this all in a do catch block because all of this decoding can potentially throw an error.


         do {
                
                    guard let safeData = data else { return }
                    
                    let decoder = JSONDecoder()
                    let appGroup = try decoder.decode(AppGroup.self, from: safeData)
                    
                    
                    
                    } catch {
                        
                    print("Failed to decode:", error)
                        
            }
                    
            
        }.resume()
        

### 6. Depending on the design pattern you’ve chosen, you may not have access to the data you’re receiving back in another controller. This can be solved by using a completion handler as a parameter to your fetch function.  It would look something like this.

For this completed fetch, your data should resemble this:

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
                    
                    print(appGroup.feed.results.forEach({print($0.name)}))
                    
                    completion(appGroup, nil)
                    
                    } catch {
                        
                        completion(nil, error)
                        
            }
                    
            
        }.resume()
        
        
    }
    

And in the controller you call the function it should look like this:

    func fetchData() {
    
        Service.shared.fetchGames { (appGroup, error) in
            
            if let error = error {
                
                print("Filed to fetch games", error)
                return
                
            }
            
            print(appGroup?.feed.results)
            
        }
        
    }
    







