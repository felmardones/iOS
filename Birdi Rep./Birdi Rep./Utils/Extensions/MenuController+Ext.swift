//
//  MenuController+Ext.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

extension MenuController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionItemsArray[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        let label = UILabel()
        label.font  = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.backgroundColor   = .white
        label.text  = sectionArray[section]
        label.textColor = .black
        
        vw.backgroundColor      = .white
        vw.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: vw.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: vw.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: vw.leadingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: vw.centerYAnchor),
        ])
        
        return vw
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath) as! MenuWalletCell
        
        switch indexPath.section {
        case 0:
            cell.iconImage.image       = UIImage(systemName: "creditcard")
            cell.totalBalance.text  = "$ 0"
        case 1:
            cell.iconImage.image       = UIImage(systemName: "house")
            cell.totalBalance.isHidden  = true
        case 2:
            cell.iconImage.image       = UIImage(systemName: "mappin.and.ellipse")
            cell.totalBalance.isHidden  = true
        default:
            cell.iconImage.image       = UIImage(systemName: "creditcard")
        }
        
        cell.iconImage.tintColor    = UIColor(red:0.30, green:0.82, blue:0.67, alpha:1.0)
        cell.titleLabel.font        = UIFont(name: "HelveticaNeue", size: 12)
        cell.titleLabel.textColor   = .black
        cell.totalBalance.font      = UIFont(name: "HelveticaNeue-Bold", size: 14)
        cell.totalBalance.textColor = .black
        cell.setTitleLabelCell(text: sectionItemsArray[indexPath.section][indexPath.row])
        
        cell.backgroundColor        = .white
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuWalletCell
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .allowUserInteraction , animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                cell.contentView.backgroundColor = UIColor.cyan
                
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                cell.contentView.backgroundColor = UIColor.white
                
            }
        }, completion: nil)
    }
}
