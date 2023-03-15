//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 13.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    

    private let contentPostView: UIView = {
        let contentPostView = UIView()
        contentPostView.translatesAutoresizingMaskIntoConstraints = false
        return contentPostView
    }()

    
    private var userPost: UILabel = {
        let userPost = UILabel()
        userPost.translatesAutoresizingMaskIntoConstraints = false
        userPost.textColor = .black
        userPost.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        userPost.numberOfLines = 2
            return userPost
        }()
        
        private var descriptionPost: UILabel = {
            let descriptionPost = UILabel()
            descriptionPost.translatesAutoresizingMaskIntoConstraints = false
            descriptionPost.numberOfLines = 0
            descriptionPost.lineBreakMode = .byClipping
            descriptionPost.textColor = .lightGray
            descriptionPost.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return descriptionPost
        }()
        
        private var imagePost: UIImageView = {
            let imagePost = UIImageView()
            imagePost.translatesAutoresizingMaskIntoConstraints = false
            imagePost.contentMode = .scaleAspectFit
            imagePost.backgroundColor = .black
            imagePost.clipsToBounds = true
            return imagePost
        }()
            
        private var likesPost: UILabel = {
            let likesPost = UILabel()
            likesPost.translatesAutoresizingMaskIntoConstraints = false
            likesPost.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
            likesPost.textColor = .black
            return likesPost
        }()

        private var viewsPost: UILabel = {
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
        

        [contentPostView, userPost, descriptionPost, imagePost, likesPost, viewsPost].forEach { contentView.addSubview($0) }
        
        
            NSLayoutConstraint.activate([
                
             contentPostView.leadingAnchor.constraint(equalTo: leadingAnchor),
             contentPostView.trailingAnchor.constraint(equalTo: trailingAnchor),
              
              userPost.topAnchor.constraint(equalTo: contentPostView.topAnchor, constant: 16),
              userPost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),

              imagePost.topAnchor.constraint(equalTo: userPost.bottomAnchor, constant: 4),
              imagePost.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor),
              imagePost.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
              imagePost.centerXAnchor.constraint(equalTo: contentPostView.centerXAnchor),
              imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
              imagePost.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                
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
