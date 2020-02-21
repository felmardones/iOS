//
//  SearchVC.swift
//  GHF
//
//  Created by Felipe on 30-12-19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImgView         = UIImageView()
    let usernameTextField   = GHTextField()
    let callToActionButton  = GHButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered : Bool{
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubViews(logoImgView,usernameTextField, callToActionButton)
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        dismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text  = ""
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func dismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC(){
        guard isUsernameEntered else {
            presentGHAlertOnMainThread(title: "Empty User Name", message: "Please enter an username, we need to know who to look for 😅", buttonTitle: "Ok")
            return
            
        }
        
        //self.view.endEditing(true)
        usernameTextField.resignFirstResponder()

        let followerListVC = FollowerListVC(username: usernameTextField.text! )
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    func configureLogoImageView(){
        logoImgView.translatesAutoresizingMaskIntoConstraints = false
        logoImgView.image                       = Images.ghLogo
        
        let topConstraintConstant: CGFloat      = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        NSLayoutConstraint.activate([
            logoImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant),
            logoImgView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImgView.heightAnchor.constraint(equalToConstant: 200),
            logoImgView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField(){
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImgView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),//negative!
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton(){
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

extension SearchVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
