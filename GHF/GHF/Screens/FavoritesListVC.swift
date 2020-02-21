//
//  FavoritesListVC.swift
//  GHF
//
//  Created by Felipe on 30-12-19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class FavoritesListVC: GHDataLoadingVC {
    let tableView               = UITableView()
    var favorites: [Follower]   = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController(){
        view.backgroundColor    = .systemBackground
        title                   = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles  = true
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.removeExcessCells()
        tableView.register(FavoriteCellTableViewCell.self, forCellReuseIdentifier: FavoriteCellTableViewCell.reuseID)
    }
    
    func getFavorites(){
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let favorites):
                self.updateUI(with: favorites)
            case .failure(let error):
                self.presentGHAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Oks")
            }
        }
    }
    
    func updateUI(with favorites: [Follower]){
        if favorites.isEmpty{
            self.showEmptyStateView(with: "No Favorites?\nAdd one on the follower screen", in: self.view)
        }else{
            self.favorites  = favorites
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension FavoritesListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell        = tableView.dequeueReusableCell(withIdentifier: FavoriteCellTableViewCell.reuseID) as! FavoriteCellTableViewCell
        let favorite    = favorites[indexPath.row]
        cell.setFavorite(favorite: favorite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite    = favorites[indexPath.row]
        let destVC      = FollowerListVC(username: favorite.login)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle  == .delete  else { return }
        let favorite    = favorites[indexPath.row]
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self  = self else { return }
            
            guard let error = error else {
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            
            self.presentGHAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}

