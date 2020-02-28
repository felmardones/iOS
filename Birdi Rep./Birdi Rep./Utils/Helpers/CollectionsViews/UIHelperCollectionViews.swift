//
//  UIHelperCollectionViews.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

enum UIHelperCollectionViews{
    
    static func createThreeColumnFlowLayout(in view : UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        let padding:CGFloat                 = 10
        let minimummItemSpacing: CGFloat    = 5
        
        let availableWidth                  = width - (padding * 2) - (minimummItemSpacing * 2)
        let itemWidth                       = availableWidth / 2
        let itemHeight                      = itemWidth + 40
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.sectionInset             = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemHeight)
        
        
        return flowLayout
    }
    
    static func changeColumnFlowLayoutOneColumn(in view:UIView) -> UICollectionViewFlowLayout{
        let width                           = view.bounds.width
        let padding:CGFloat                 = 10
        let minimummItemSpacing: CGFloat    = 5
        
        let availableWidth                  = width - (padding * 2) - (minimummItemSpacing * 2)
        let itemWidth                       = availableWidth / 1
        let itemHeight                      = itemWidth + 40
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.sectionInset             = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemHeight)
        
        return flowLayout
    }
}
