//
//  GHFollowerItemVC.swift
//  GHF
//
//  Created by Felipe on 26-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

protocol GHFollowerItemVCDelegate: class{
    func didTapGetFollowers(for user: User)
}

class GHFollowerItemVC: GHItemInfoVC{
    
    weak var delegate: GHFollowerItemVCDelegate!
    
    init(user: User, delegate: GHFollowerItemVCDelegate){
        super.init(user: user)
        self.delegate   = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoTwo.set(itemInfoType: .following, withCount: user.following)
        actionBtn.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTap(_ sender: UIButton) {
        delegate.didTapGetFollowers(for: user)
    }
}
