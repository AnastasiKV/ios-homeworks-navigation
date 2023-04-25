//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController  {
    
    
    private var allPosts: [PostModel] = PostModel.makeMockPost()
    private var allImagesStruct: [ImageStructProfile] = ImageStructProfile.makeImageStruct()
    
    
    private lazy var  profileTableView : UITableView = {
        let profileTableView = UITableView(frame: .zero, style: .grouped)
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.separatorInset = .zero
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        profileTableView.rowHeight = UITableView.automaticDimension
        
        profileTableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileTableHeaderView.identifier)
        profileTableView.register(ImagesTableViewCell.self, forCellReuseIdentifier: ImagesTableViewCell.identifier)
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        return profileTableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
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


// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return allImagesStruct.count
        } else {
            return allPosts.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: ImagesTableViewCell.identifier, for: indexPath) as! ImagesTableViewCell
            cell.setupCell(allImagesStruct[indexPath.row])
            cell.delegate = self
            return cell
        } else {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.likeDelegate = self
            cell.setupCell(post: allPosts[indexPath.row])
            return cell
        }
    }
}


// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return .zero }
        return 220
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let header = ProfileTableHeaderView()
        return header
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let imageController = ImageCollectionController()
            navigationController?.pushViewController(imageController, animated: true)
        } else {
            allPosts[indexPath.row].views += 1
            let detailController = DetailPostViewController()
            detailController.setupCell(post: allPosts[indexPath.row])
            navigationController?.pushViewController(detailController, animated: true)
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard indexPath.section == 1 else { return .none }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allPosts.remove(at: indexPath.row)
            profileTableView.reloadData()
        }
    }
}


// MARK: - LikesTapDelegate

extension ProfileViewController:  LikesTapDelegate {
    func tapLikesLabel(cell: PostTableViewCell) {
        if let indexPathLikes = profileTableView.indexPath(for: cell) {
            allPosts[indexPathLikes.row].likes += 1
        }
        profileTableView.reloadData()
    }
}


// MARK: - ImagesTableViewCellProtocol

extension ProfileViewController: ImagesTableViewCellDelegate {
    func delegateButtonAction(cell: ImagesTableViewCell) {
        let imagesViewController = ImageCollectionController()
        self.navigationController?.pushViewController(imagesViewController, animated: true)
    }
    
}
