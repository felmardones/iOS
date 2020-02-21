//
//  UIHelper.swift
//  GHF
//
//  Created by Felipe on 07-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func createThreeColumnFlowLayout(in view : UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        let padding:CGFloat                 = 12
        let minimummItemSpacing: CGFloat    = 10
        
        let availableWidth                  = width - (padding * 2) - (minimummItemSpacing * 2)
        let itemWidth                       = availableWidth / 3
        let itemHeight                      = itemWidth + 40
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.sectionInset             = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemHeight)
        
        
        return flowLayout
    }
}
