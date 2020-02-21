//
//  GHDataLoadingVC.swift
//  GHF
//
//  Created by Felipe on 03-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class GHDataLoadingVC: UIViewController {
    
    fileprivate var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showLoadingView(){
        
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: { self.containerView.alpha = 0.8 })
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView){
        let emptyStateView = GHEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    
}
