//
//  ghemptyStateView.swift
//  GHF
//
//  Created by Felipe on 10-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class GHEmptyStateView: UIView {
    
    let messsageLabel = GHTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String){
        self.init(frame: .zero)
        messsageLabel.text = message
    }
    
    func configure(){
        addSubViews(messsageLabel, logoImageView)
        configureMessageLabel()
        configureLogoImageView()
    }
    
    private func configureMessageLabel(){
        messsageLabel.numberOfLines = 3
        messsageLabel.textColor     = .secondaryLabel
        
        let labelCenterYConstant: CGFloat       = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
        
        NSLayoutConstraint.activate([
            messsageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant),
            messsageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messsageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messsageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configureLogoImageView(){
        logoImageView.image         = Images.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let logoBottomConstant: CGFloat         = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
        ])
    }
}
