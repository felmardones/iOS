//
//  GFButton.swift
//  GHF
//
//  Created by Felipe on 30-12-19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class GHButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor : UIColor, title: String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure(){
        layer.cornerRadius  = 10
        titleLabel?.font    = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)

        translatesAutoresizingMaskIntoConstraints = false //it's for use autolayout
    }
    
    func set(backgroundColor: UIColor, title: String){
        self.backgroundColor    = backgroundColor
        setTitle(title, for: .normal)
    }
}
