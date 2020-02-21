//
//  GHRepoItemVC.swift
//  GHF
//
//  Created by Felipe on 26-01-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

protocol GHRepoItemVCDelegate: class{
    func didTapGithubProfile(for user: User)
}

class GHRepoItemVC: GHItemInfoVC{
    
    weak var delegate: GHRepoItemVCDelegate!
    
    
    init(user: User, delegate: GHRepoItemVCDelegate){
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
        itemInfoOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionBtn.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTap(_ sender: UIButton) {
        delegate.didTapGithubProfile(for: user)
    }
}
