//
//  Container+Ext.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation

extension ContainerController: HomeControllerDelegate{
    
    func handleMenuToggle() {
        print("going to hide or show menu")
        if !isExpanded{
            configureMenuController()
        }
        isExpanded  = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
