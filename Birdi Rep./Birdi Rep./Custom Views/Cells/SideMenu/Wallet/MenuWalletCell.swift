//
//  MenuWalletCell.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class MenuWalletCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalBalance: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    
    func setTitleLabelCell(text title: String){
        titleLabel.text = title
    }
    
}
