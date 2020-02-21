//
//  PersistenceManager.swift
//  GHF
//
//  Created by Felipe on 28-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation

enum PersistenceActionType{
    case add, remove
}

enum PersistenceManager{
    
    static private let defaults = UserDefaults.standard
    
    enum Keys{  static let favorites = "favorites"  }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GHError?) -> Void){
        
        retrieveFavorites{ result in
            
            switch result{
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else{
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    favorites.append(favorite)
                    
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                completed(save(favorites: favorites))
            case .failure(let error):
                completed(error)
            }
            
        }
        
        
    }
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GHError>) -> Void){
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do{
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            //                completed(follower, nil)
            completed(.success(favorites))
            print("success")
        }catch{
            print("error not success")
            //                completed(nil, .invalidData)
            completed(.failure(.unableToFavorite))
            //                completed(nil, error.localizedDescription)
        }
    }
    
    static func save(favorites: [Follower]) -> GHError? {
        do{
            let encoder = JSONEncoder()
            let encoderFavorites    = try encoder.encode(favorites)
            defaults.set(encoderFavorites, forKey: Keys.favorites)
            return nil
        }catch {
            return .unableToFavorite
        }
    }
}
