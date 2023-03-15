//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController  {
    
    private var section: [String] {["PostModel"]}
    private var allPosts = PostModel.makeMockPost()
    
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section  == 0 ? 1 : allPosts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
//            cell.setupCell(section [0])
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: allPosts[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
    
    
    extension ProfileViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTableHeaderView.identifier)
                else {
                    return nil
                }
                return header
            }
            return nil
        }
        
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 240
        }
}
