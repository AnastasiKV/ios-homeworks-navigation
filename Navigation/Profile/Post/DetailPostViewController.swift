//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 22.04.2023.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    private lazy var detailScrollView: UIScrollView = {
        let detailScrollView = UIScrollView()
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        return detailScrollView
    }()
    
    private lazy var detailContentView: UIView = {
        let detailContentView = UIView()
        detailContentView.translatesAutoresizingMaskIntoConstraints = false
        detailContentView.backgroundColor = .white
        return detailContentView
    }()
    
    
    private lazy var userPost: UILabel = {
        let userPost = UILabel()
        userPost.translatesAutoresizingMaskIntoConstraints = false
        userPost.textColor = .black
        userPost.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userPost.numberOfLines = 2
        return userPost
    }()
    
    private lazy var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        imagePost.clipsToBounds = true
        return imagePost
    }()
    
    private lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        descriptionPost.numberOfLines = 0
        descriptionPost.lineBreakMode = .byClipping
        descriptionPost.textColor = .lightGray
        descriptionPost.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return descriptionPost
    }()
    
    private lazy var likesPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        viewsPost.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        viewsPost.textColor = .black
        return viewsPost
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func setupCell(post:PostModel) {
        userPost.text = post.author
        imagePost.image = post.image
        descriptionPost.text = post.description
        likesPost.text = " Likes: \(post.likes)"
        viewsPost.text = "Views: \(post.views)"
    }
    
    private func layout() {
        
        view.addSubview(detailScrollView)
        
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        detailScrollView.addSubview(detailContentView)
        
        NSLayoutConstraint.activate([
            detailContentView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            detailContentView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
            detailContentView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor),
            detailContentView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor),
            detailContentView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor)
        ])
        
        
        [userPost, imagePost, descriptionPost, likesPost, viewsPost ].forEach { detailContentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            
            userPost.topAnchor.constraint(equalTo: detailContentView.topAnchor),
            userPost.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor,constant: 20),
            userPost.heightAnchor.constraint(equalToConstant: 50),
            
            imagePost.topAnchor.constraint(equalTo: userPost.bottomAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imagePost.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            descriptionPost.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor,constant: -16),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 10),
            likesPost.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: 16),
            likesPost.bottomAnchor.constraint(equalTo: detailContentView.bottomAnchor, constant: -10),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 10),
            viewsPost.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor, constant: -16),
            viewsPost.bottomAnchor.constraint(equalTo: detailContentView.bottomAnchor, constant: -10)
        ])
    }
    
}


