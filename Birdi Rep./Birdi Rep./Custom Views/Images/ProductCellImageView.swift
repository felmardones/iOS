//
//  ProductCellView.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class ProductCellImageView: UIImageView {

    let placeHolderImage    = Images.placeholder
    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeHolderImage
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
    func downloaImage(fromUrl url: String){
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image  = image
            }
        }
    }
    
}
