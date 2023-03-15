//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

 final class ProfileViewController: UIViewController {
 
  
   
    private let allPosts: [[PostModel]] = PostModel.makeMockPost()
 
     
    
     
    private lazy var  profileTableView : UITableView = {
        let profileTableView = UITableView(frame: .zero, style: .grouped)
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.backgroundColor = .white
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 400
        profileTableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.identifier)
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return profileTableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
    }
     
     
     
    func layout() {
        view.addSubview(profileTableView)
        
        
        NSLayoutConstraint.activate([

            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

}


extension ProfileViewController: UITableViewDataSource {
       
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allPosts[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: allPosts[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.identifier)
        return header
    }
    
}


extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
       }
    
}






