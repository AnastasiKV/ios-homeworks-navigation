//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    

    
    var titleProfile: String = "Profile"
        
 
    var profileView: ProfileHeaderView = ProfileHeaderView()
        
    
    var changeTitleButton: UIButton = {
        let changeTitleButton = UIButton()
        changeTitleButton.translatesAutoresizingMaskIntoConstraints = false
        changeTitleButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        changeTitleButton.setTitle("Change Title", for: .normal)
        changeTitleButton.titleLabel?.textColor = .white
            return changeTitleButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileView)
        view.backgroundColor = .white
        self.navigationItem.title = titleProfile
        setupConstraint()
        

    }
        

    override func viewWillLayoutSubviews() {


    }
    
    
    func setupConstraint() {
            view.addSubview(profileView)
            view.addSubview(changeTitleButton)
            profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
            
                ])
        
   }

}




