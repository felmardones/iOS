//
//  NetworkManager.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    private let baseUrl = ""
    let cache           = NSCache<NSString, UIImage>()
    
    func retrieveJsonFileProducts(completed: @escaping (Result<[Product],Error>) -> Void){
        print("Retrieve")
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let products = try decoder.decode([Product].self, from: data)
                completed(.success(products))
            } catch {
                print("error:\(error)")
                completed(.failure(error))
            }
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping(UIImage?) -> Void){
        
        let cacheKey     = NSString(string: urlString)
        if let image     = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200 ,
                let data = data,
                let image = UIImage(data: data) else{
                    completed(nil)
                    return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completed(image)
            }
            
        }
        
        task.resume()
        
    }
}
