//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var titleProfile: String = "Profile"
    
    let profileView = ProfileHeaderView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titleProfile
        
        view.backgroundColor = .white
        view.addSubview(profileView)
        
    }
    

    override func viewWillLayoutSubviews() {
        profileView.frame = CGRect(x: 0, y: 95, width: 400, height: 700)
        
        
    }
}




