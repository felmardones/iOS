//
//  ContainerController.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import Foundation

import UIKit

class ContainerController: UIViewController {
    
    //    MARK: - Properties
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    
    var isExpanded = false
    
    //    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureHomeController()
        
        print("Did add menu controller")
    }
    
    //    MARK: - Handlers
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureHomeController(){
        let homeController      = HomeController()
        homeController.delegate = self
        centerController        = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        centerController.view.backgroundColor    = .systemGreen
    }
    
    func configureMenuController(){
        print("triggerMenuController")
        if menuController == nil{
            self.menuController = self.storyboard?.instantiateViewController(withIdentifier: "menu") as! MenuController
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
    
    func showMenuController(shouldExpand: Bool){
        if shouldExpand{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x   = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x   = 0
            }, completion: nil)
        }
    }
}

