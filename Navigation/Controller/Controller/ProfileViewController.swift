//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController  {
    
    private var allPosts: [PostModel] = PostModel.makeMockPost()
    
    
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
        view.backgroundColor = .white
        layout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func layout() {
        view.addSubview(profileTableView)
        
        
        NSLayoutConstraint.activate([
            
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.likeDelegate = self
            cell.setupCell(post: allPosts[indexPath.row])
            return cell
        } else {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.likeDelegate = self
            cell.setupCell(post: allPosts[indexPath.row])
            return cell
        }
    }
}



extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileTableHeaderView()
        return header
    }
    
}

//        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//                if indexPath.section == 0 {
//                    return .none
//                } else {
//                    return .delete
//                }
//            }
//
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            self.profileTableView.beginUpdates()
//                allPosts.remove(at: indexPath.row)
//                self.profileTableView.deleteRows(at: [indexPath], with: .automatic)
//                self.profileTableView.endUpdates()
//            }
//    }



extension ProfileViewController:  LikesTapDelegate {
    func tapLikesLabel(cell: PostTableViewCell) {
        if let indexPathLikes = profileTableView.indexPath(for: cell) {
            allPosts[indexPathLikes.row].likes += 1
        }
        profileTableView.reloadData()
    }
}
