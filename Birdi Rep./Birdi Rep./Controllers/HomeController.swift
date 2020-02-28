//
//  FirstViewController.swift
//  Birdi Rep.
//
//  Created by Felipe on 26-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    //    MARK: - Properties
    enum Section {  case main  }
    
    var delegate: HomeControllerDelegate?
    var collectionView : UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Product>!
    var isCollectionOneColumn   = false
    var products: [Product] = []
    var hasMoreProduct = false
    
    //    MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor    = UIColor(red:0.88, green:0.88, blue:0.88, alpha:1.0)
        
        configureNavigationBar()
        configureCollectionView()
        getProducts()
        configureDataSource()
        
    }
    //    MARK: - Handlers
    
    
    
    func configureNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.hidesBarsOnSwipe = true
        
        navigationItem.leftBarButtonItem    = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withTintColor(.black, renderingMode: .alwaysOriginal) , style: .plain, target: self, action: #selector(handleMenuToggle))
        
        navigationItem.rightBarButtonItem   = UIBarButtonItem(image: UIImage(systemName: "square.fill"), style: .plain, target: self, action: #selector(changeCollectionFlowLayout))
        
        navigationItem.rightBarButtonItem?.tintColor    = UIColor(red:0.00, green:0.13, blue:0.29, alpha:1.0)
        
    }
    
    
    private func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelperCollectionViews.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseID)
    }
    
    func configureDataSource(){
        dataSource  = UICollectionViewDiffableDataSource<Section, Product>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, product) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
            cell.set(product: product)
            return cell
        })
    }
    
    func getProducts(){
        NetworkManager.shared.retrieveJsonFileProducts { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let products):
                print("success!")
                self.updateUI(with: products)
            case .failure(let error):
                print("error")
                print(error)
            }
        }
    }
    
    func updateUI(with products: [Product]){
        if products.count < 100 { self.hasMoreProduct = false }
        self.products.append(contentsOf: products)
        
        DispatchQueue.main.async {
            let message = "Can't update"
            if self.products.isEmpty {
                print(message)
            }
        }
        
        self.updateData(on: self.products)
    }
    
    func updateData(on products: [Product]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
    
    @objc func changeCollectionFlowLayout(){
        print("change!")
        print("isOneColumn")
        print(isCollectionOneColumn)
        var newLayout = UICollectionViewFlowLayout()
        var newNavBarIconRight = UIImage()
        if isCollectionOneColumn{
            newLayout = UIHelperCollectionViews.createThreeColumnFlowLayout(in: view)
            newNavBarIconRight  = UIImage(systemName: "square.fill")!.withRenderingMode(.alwaysTemplate)
            
        }else{
            newLayout = UIHelperCollectionViews.changeColumnFlowLayoutOneColumn(in: view)
            newNavBarIconRight  = UIImage(systemName: "square.grid.2x2.fill")!.withRenderingMode(.alwaysTemplate)
        }
        
        navigationItem.rightBarButtonItem?.image    = newNavBarIconRight
        
        collectionView.reloadData()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(newLayout, animated: true)
        isCollectionOneColumn = !isCollectionOneColumn
    }
}

extension HomeController: UICollectionViewDelegate{}
