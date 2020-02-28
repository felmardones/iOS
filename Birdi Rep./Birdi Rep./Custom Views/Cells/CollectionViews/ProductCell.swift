//
//  ProductCell.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseID = "ProductCellImage"
    
    let productImageView = ProductCellImageView(frame: .zero)
    let productTitle     = ProductLabelTitleCV(textAlignment: .left, fontSize: 12)
    let price            = UILabel()
    let stackPrice       = UIStackView()
    let iconLike         = UIImageView(image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate))
    let iconWish         = UIImageView(image: UIImage(systemName: "bookmark.fill")?.withRenderingMode(.alwaysTemplate))
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func willTransition(from oldLayout: UICollectionViewLayout, to newLayout: UICollectionViewLayout) {
        updateCellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(product: Product){
        productTitle.text   = product.product
        productImageView.downloaImage(fromUrl: product.imageUrl)
    }
    
    func updateCellShadow(){
        contentView.frame = bounds;
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
    }
    
    private func configure(){
        
        contentView.layer.cornerRadius  = 6.0
        contentView.layer.borderWidth   = 1.0
        contentView.layer.borderColor   = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        contentView.backgroundColor     = .white
        
        
        
        
        addSubview(productImageView)
        addSubview(productTitle)
        addSubview(stackPrice)
        price.text  = "$89.999"
        price.textColor = .black
        price.font      = UIFont.boldSystemFont(ofSize: 16.0)
        
        stackPrice.axis = .horizontal
        stackPrice.alignment    = .fill
        stackPrice.distribution = .fillProportionally
        
        stackPrice.addArrangedSubview(price)
        stackPrice.addArrangedSubview(iconLike)
        stackPrice.addArrangedSubview(iconWish)
        stackPrice.translatesAutoresizingMaskIntoConstraints    = false
        
        
        iconLike.sizeToFit()
        iconLike.contentMode    = .scaleAspectFit
        iconLike.tintColor      = UIColor(red:0.81, green:0.83, blue:0.85, alpha:1.0)
        
        iconWish.sizeToFit()
        iconWish.contentMode    = .scaleAspectFit
        iconWish.tintColor      = UIColor(red:0.81, green:0.83, blue:0.85, alpha:1.0)
        
        
        iconLike.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconLikeOnPress)))
        iconWish.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconWishOnPress)))
        
        
        iconLike.isUserInteractionEnabled   = true
        iconWish.isUserInteractionEnabled   = true
        
        let padding : CGFloat = 8
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
            productTitle.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
            productTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            productTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            productTitle.heightAnchor.constraint(equalToConstant: 20),
            stackPrice.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 5),
            stackPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackPrice.heightAnchor.constraint(equalToConstant: 25),
            iconLike.widthAnchor.constraint(equalToConstant: 20),
            iconLike.heightAnchor.constraint(equalToConstant: 20),
            iconLike.trailingAnchor.constraint(equalTo: iconWish.leadingAnchor, constant: -5),
            iconWish.widthAnchor.constraint(equalToConstant: 15),
            iconWish.heightAnchor.constraint(equalToConstant: 15),
            
        ])
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSubviews()
        layer.cornerRadius = 10
        dropShadow(radius: 3, offsetX: 0, offsetY: 0, color: .gray)
    }
    
    @objc func iconLikeOnPress(){
        
        let colorFrom = UIColor(red:1.00, green:0.03, blue:0.27, alpha:1.0)
        let colorTo   = UIColor(red:1.00, green:0.68, blue:0.59, alpha:1.0)
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            colorFrom.cgColor,
            colorTo.cgColor
        ]
        gradient.frame = iconLike.bounds
        
        iconLike.clipsToBounds  = false
        
        let mask = CALayer()
        mask.contents = iconLike.image?.cgImage
        let originAdjust    = CGPoint(x: gradient.bounds.origin.x, y: gradient.bounds.origin.y )
        let sizeAdjust      = CGSize(width: gradient.bounds.size.width, height:  gradient.bounds.size.height - 4)
        
        mask.frame = CGRect(origin: originAdjust, size: sizeAdjust)
        
        gradient.mask = mask
        
        iconLike.layer.insertSublayer(gradient, at: 0)
    }
    
    @objc func iconWishOnPress(){
        let colorFrom = UIColor(red:1.00, green:0.53, blue:0.11, alpha:1.0)
        let colorTo   = UIColor(red:1.00, green:0.88, blue:0.45, alpha:1.0)
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            colorFrom.cgColor,
            colorTo.cgColor
        ]
        
        gradient.frame = iconWish.bounds
        iconWish.clipsToBounds  = false
        
        let mask = CALayer()
        mask.contents = iconWish.image?.cgImage
        let originAdjust    = CGPoint(x: gradient.bounds.origin.x, y: gradient.bounds.origin.y )
        let sizeAdjust      = CGSize(width: gradient.bounds.size.width, height:  gradient.bounds.size.height - 4)
        
        mask.frame = CGRect(origin: originAdjust, size: sizeAdjust)
        
        gradient.mask = mask
        
        iconWish.layer.insertSublayer(gradient, at: 0)
    }
}
