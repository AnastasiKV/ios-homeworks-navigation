//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 13.03.2023.
//

import UIKit


class PostTableViewCell: UITableViewCell {
    
    
    weak var likeDelegate: LikesTapDelegate?
    
    
    private lazy var contentPostView: UIView = {
        let contentPostView = UIView()
        contentPostView.translatesAutoresizingMaskIntoConstraints = false
        return contentPostView
    }()
    
    
    private lazy var userPost: UILabel = {
        let userPost = UILabel()
        userPost.translatesAutoresizingMaskIntoConstraints = false
        userPost.textColor = .black
        userPost.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userPost.numberOfLines = 2
        return userPost
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
    
    private lazy var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        imagePost.clipsToBounds = true
        return imagePost
    }()
    
    
    private lazy var likesPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        let tapLikeGesture = UITapGestureRecognizer(target: self, action: #selector(likesAction))
        label.addGestureRecognizer(tapLikeGesture)
        return label
    }()
    
    
    @objc func likesAction () {
        likeDelegate?.tapLikesLabel(cell: self)
    }
    
    
    private lazy var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        viewsPost.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        viewsPost.textColor = .black
        return viewsPost
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userPost.text = ""
        imagePost.image = nil
        descriptionPost.text = ""
        likesPost.text = ""
        viewsPost.text = ""
    }
    
    
    func setupCell(post:PostModel) {
        userPost.text = post.author
        imagePost.image = post.image
        descriptionPost.text = post.description
        likesPost.text = " Likes: \(post.likes)"
        viewsPost.text = "Views: \(post.views)"
    }
    
    
    private func customizeCell() {
        contentPostView.backgroundColor = .white
    }
    
    
    func layout() {
        
        [contentPostView, userPost, descriptionPost, imagePost, likesPost, viewsPost ].forEach { contentView.addSubview($0) }
        
        
        let heightView: CGFloat = 100
        let viewInset: CGFloat = 8
        let imageInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            
            contentPostView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -viewInset),
            contentPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            contentPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: viewInset),
            
            
            userPost.topAnchor.constraint(equalTo: contentPostView.topAnchor, constant: 16),
            userPost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),
            
            imagePost.topAnchor.constraint(equalTo: userPost.bottomAnchor, constant: imageInset),
            imagePost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: -imageInset),
            imagePost.widthAnchor.constraint(equalToConstant: heightView - imageInset * 5),
            imagePost.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
            imagePost.centerXAnchor.constraint(equalTo: contentPostView.centerXAnchor),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            descriptionPost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            likesPost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),
            likesPost.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -16),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            viewsPost.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            viewsPost.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -16)
            
        ])
    }
    
}

