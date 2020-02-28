//
//  ProductLabelTitleCV.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class ProductLabelTitleCV: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }
    
    private func configure(){
        textColor                 = .black
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.9
        lineBreakMode             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
