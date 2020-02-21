//
//  UITableView+Ext.swift
//  GHF
//
//  Created by Felipe on 04-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

extension UITableView{
    func reloadDataOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
}
