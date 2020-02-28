//
//  MenuController.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    //    MARK: - Properties
    let scrollView      = UIScrollView()
    let stackContainer  = UIStackView()
    
    
    
    let stack           = UIStackView()
    let viewLogo        = UIView()
    let viewSale        = UIView()
    let viewTable       = UIView()
    let viewButton      = UIView()
    let viewHelp        = UIView()
    
    let imageLogo   = UIImageView()
    let imageSale   = UIImageView()
    
    let imageHelp   = UIImageView()
    let buttonCupon = UIButton()
    
    var tableView = UITableView()
    
    
    let sectionArray        = ["BirdiWallet", "Mis datos de vendedor", "Mis datos de Comprador"]
    let sectionItemsArray   = [["Saldo", "birdiCréditos"], ["Cuenta Bancaria para recibir pagos"], ["Historial de compras y Tracking"]]
    
    
    //    MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureBtn()
        configureTableView()
        configureHelp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("appearing!")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let colorFrom = UIColor(red:0.93, green:0.37, blue:0.00, alpha:1.0)
        let colorTo   = colorFrom.lighter()
        let bound     = CGRect(x: viewSale.bounds.origin.x + CGFloat(20), y: viewSale.bounds.origin.y - CGFloat(5), width: viewSale.bounds.size.width - CGFloat(40), height: viewSale.bounds.size.height + CGFloat(10))
        
        
        
        let gradientLayer = UIColor.createGradientLayer(bounds: bound, colors: [colorFrom.cgColor, colorTo!.cgColor], locations: [0.30, 1.0])
        gradientLayer.cornerRadius  = 20
        
        
        let boundHelp     = CGRect(x: viewHelp.bounds.origin.x + CGFloat(20), y: viewHelp.bounds.origin.y - CGFloat(5), width: viewHelp.bounds.size.width - CGFloat(40), height: viewHelp.bounds.size.height + CGFloat(10))
        let gradientLayerHelp = UIColor.createGradientLayer(bounds: boundHelp, colors: [colorFrom.cgColor, colorTo!.cgColor], locations: [0.30, 1.0])
        
        viewSale.layer.insertSublayer(gradientLayer, at: 0)
        viewHelp.layer.insertSublayer(gradientLayerHelp, at: 0)
    }
    
    
    //    MARK: - Handlers
    
    func configureViews(){
        view.addSubview(stackContainer)
        view.backgroundColor    = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        view.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true;
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true;
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true;
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true;
        
        scrollView.addSubview(self.stackContainer)
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        stackContainer.axis            = .vertical
        stackContainer.alignment       = .center
        stackContainer.distribution    = .fillProportionally
        stackContainer.spacing         = 0;
        stackContainer.isUserInteractionEnabled    = true
        scrollView.isUserInteractionEnabled    = true
        
        stackContainer.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        stackContainer.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        stackContainer.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        stackContainer.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        stackContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor).isActive = true;
        
        stackContainer.addArrangedSubview(viewLogo)
        stackContainer.addArrangedSubview(viewSale)
        stackContainer.addArrangedSubview(viewButton)
        stackContainer.addArrangedSubview(viewTable)
        stackContainer.addArrangedSubview(viewHelp)
        
        imageLogo.image = UIImage(named:"icon_logo")
        imageLogo.sizeToFit()
        imageLogo.contentMode   = .scaleAspectFit
        
        viewLogo.addSubview(imageLogo)
        
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.topAnchor.constraint(equalTo: self.viewLogo.topAnchor).isActive                           = true
        imageLogo.leadingAnchor.constraint(equalTo: self.viewLogo.leadingAnchor, constant: 100).isActive    = true
        imageLogo.trailingAnchor.constraint(equalTo: self.viewLogo.trailingAnchor, constant: -100).isActive = true
        imageLogo.bottomAnchor.constraint(equalTo: self.viewLogo.bottomAnchor).isActive                     = true
        
        imageSale.image = UIImage(named:"salesAutumn")
        imageSale.contentMode           = .scaleAspectFit
        imageSale.sizeToFit()
        imageSale.layer.shadowOffset    = CGSize(width: 1.0, height: 1.0);
        imageSale.layer.shadowRadius    = 2;
        imageSale.layer.shadowOpacity   = 0.3;
        imageSale.clipsToBounds      = true
        
        viewSale.addSubview(imageSale)
        
        viewSale.backgroundColor    = .clear
        
        imageSale.translatesAutoresizingMaskIntoConstraints = false
        
        imageSale.topAnchor.constraint(equalTo: self.viewSale.topAnchor).isActive                           = true
        imageSale.leadingAnchor.constraint(equalTo: self.viewSale.leadingAnchor, constant: 20).isActive     = true
        imageSale.trailingAnchor.constraint(equalTo: self.viewSale.trailingAnchor, constant: -20).isActive  = true
        imageSale.bottomAnchor.constraint(equalTo: self.viewSale.bottomAnchor).isActive                     = true
        imageSale.heightAnchor.constraint(equalToConstant: 100).isActive                                    = true
        
    }
    
    func configureBtn(){
        viewButton.addSubview(buttonCupon)
        let rightImage = UIImageView(image: UIImage(systemName: "arrowtriangle.right.fill"))
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        buttonCupon.addSubview(rightImage)
        buttonCupon.setTitle("Ingresa un cupón", for: .normal)
        buttonCupon.imageEdgeInsets = UIEdgeInsets(top: 0.5, left: 10, bottom: 0.5, right: 0.5);
        buttonCupon.titleEdgeInsets = UIEdgeInsets(top: 0.5, left: 30.5, bottom: 0.5, right: 0.5);
        buttonCupon.setTitleColor(.black, for: .normal)
        buttonCupon.contentHorizontalAlignment = .left
        buttonCupon.setImage(UIImage(systemName: "tag"), for: .normal)
        buttonCupon.backgroundColor             = .white
        buttonCupon.tintColor                   = UIColor(red:0.05, green:0.12, blue:0.23, alpha:1.0)
        buttonCupon.titleLabel?.font            = UIFont(name: "Avenir Black", size: 14)
        buttonCupon.titleLabel?.textAlignment   = .left
        buttonCupon.layer.shadowColor           = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        buttonCupon.layer.shadowOffset          = CGSize(width: 0.0, height: 2.5)
        buttonCupon.layer.shadowOpacity         = 1.0
        buttonCupon.layer.shadowRadius          = 1.5
        buttonCupon.layer.masksToBounds         = false
        buttonCupon.layer.cornerRadius          = 10.0
        buttonCupon.layer.borderColor           = UIColor.black.cgColor
        buttonCupon.translatesAutoresizingMaskIntoConstraints   = false
        buttonCupon.addTarget(self, action: #selector(handleAddCupons), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            viewButton.heightAnchor.constraint(equalToConstant: 40),
            viewButton.widthAnchor.constraint(equalTo: stackContainer.widthAnchor),
            buttonCupon.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 15),
            buttonCupon.centerXAnchor.constraint(equalTo: viewButton.centerXAnchor),
            buttonCupon.heightAnchor.constraint(equalToConstant: 40),
            buttonCupon.widthAnchor.constraint(equalTo: imageSale.widthAnchor, multiplier: 1.0),
            rightImage.trailingAnchor.constraint(equalTo: buttonCupon.trailingAnchor, constant: -10),
            rightImage.centerYAnchor.constraint(equalTo: buttonCupon.centerYAnchor),
        ])
        
    }
    
    @objc func handleAddCupons(){
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        print("oli button")
        UIView.animate(withDuration: 0.2) {
            colorAnimation.fromValue = self.buttonCupon.backgroundColor?.cgColor
            colorAnimation.toValue = UIColor.cyan.cgColor
            colorAnimation.duration = 0.2
            colorAnimation.autoreverses = true
            self.buttonCupon.layer.add(colorAnimation, forKey: "ColorPulse")
        }
    }
    
    func configureTableView(){
        
        viewTable.addSubview(tableView)
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.alwaysBounceVertical      = false
        tableView.isScrollEnabled           = false
        tableView.isUserInteractionEnabled  = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor   = .clear
        
        let walletCell = UINib(nibName: "MenuWalletCell", bundle: nil)
        tableView.register(walletCell, forCellReuseIdentifier: "walletCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: viewTable.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: viewTable.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: viewTable.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: viewTable.bottomAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 400),
            tableView.widthAnchor.constraint(equalTo: stackContainer.widthAnchor)
        ])
    }
    
    func configureHelp(){
        
        viewHelp.addSubview(imageHelp)
        imageHelp.image = UIImage(named:"salesAutumn")
        imageHelp.contentMode           = .scaleAspectFit
        imageHelp.sizeToFit()
        imageHelp.layer.shadowOffset    = CGSize(width: 1.0, height: 1.0);
        imageHelp.layer.shadowRadius    = 2;
        imageHelp.layer.shadowOpacity   = 0.3;
        imageHelp.clipsToBounds      = true
        
        
        viewHelp.backgroundColor    = .clear
        
        imageHelp.translatesAutoresizingMaskIntoConstraints = false
        
        imageHelp.topAnchor.constraint(equalTo: self.viewHelp.topAnchor).isActive                           = true
        imageHelp.leadingAnchor.constraint(equalTo: self.viewHelp.leadingAnchor, constant: 20).isActive     = true
        imageHelp.trailingAnchor.constraint(equalTo: self.viewHelp.trailingAnchor, constant: -20).isActive  = true
        imageHelp.bottomAnchor.constraint(equalTo: self.viewHelp.bottomAnchor).isActive                     = true
        imageHelp.heightAnchor.constraint(equalToConstant: 300).isActive                                    = true
        
    }
    
}
