//
//  UIView+Ext.swift
//  GHF
//
//  Created by Felipe on 04-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

extension UIView{
    
    func pinToEdges(of superView: UIView){
        translatesAutoresizingMaskIntoConstraints   = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }

    func addSubViews(_ views: UIView...){
        for view in views{
            addSubview(view)
        }
    }
}
