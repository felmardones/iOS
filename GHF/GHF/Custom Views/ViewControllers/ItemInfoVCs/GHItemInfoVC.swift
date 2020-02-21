//
//  GHItemInfoVCViewController.swift
//  GHF
//
//  Created by Felipe on 26-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class GHItemInfoVC: UIViewController {
    
    let stackView   = UIStackView()
    let itemInfoOne = GHItemInfoView()
    let itemInfoTwo = GHItemInfoView()
    let actionBtn   = GHButton()
    
    var user: User!
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user   = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButton()
    }
    
    private func configureBackgroundView(){
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    private func configureStackView(){
        stackView.axis          = .horizontal
        stackView.distribution  = .equalCentering
        
        stackView.addArrangedSubview(itemInfoOne)
        stackView.addArrangedSubview(itemInfoTwo)
    }
    
    private func configureActionButton(){
        actionBtn.addTarget(self, action: #selector(actionButtonTap), for: .touchUpInside)
    }
    
    @objc func actionButtonTap(_ sender: UIButton){}
    
    private func layoutUI(){
        view.addSubViews(stackView, actionBtn)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat    = 20
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
