//
//  UIViewController+Ext.swift
//  GHF
//
//  Created by Felipe on 01-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController{
    
    func presentGHAlertOnMainThread(title : String, message : String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GHAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor  = .systemGreen
        present(safariVC, animated: true)
    }
}
