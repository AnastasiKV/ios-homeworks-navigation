//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 13.03.2023.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    private var avatarImageView: UIImageView = {
         let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "ImageAcon")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 60.0
        avatarImageView.backgroundColor = UIColor.systemPink.withAlphaComponent(0.3)
        avatarImageView.clipsToBounds = true
         return avatarImageView
         
     }()
     
     
     private var fullNameLabel: UILabel = {
         let fullNameLabel = UILabel()
         fullNameLabel.text = "Hipster Lion"
         fullNameLabel.textColor = .black
         fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
         fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
         return fullNameLabel
         
     }()
     
     
     private var statusLabel: UILabel = {
         let statusLabel = UILabel()
         statusLabel.text = "Waiting for something..."
         statusLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
         statusLabel.textColor = .gray
         statusLabel.translatesAutoresizingMaskIntoConstraints = false
         return statusLabel
         
     }()
     
     
     private var setStatusButton: UIButton = {
         let setStatusButton = UIButton()
         setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         setStatusButton.layer.cornerRadius = 14
         setStatusButton.layer.shadowColor = UIColor.black.cgColor
         setStatusButton.layer.shadowRadius = 4.0
         setStatusButton.layer.shadowOpacity = 0.7
         setStatusButton.layer.shadowOffset = CGSizeMake(4.0, 4.0)
         setStatusButton.setTitle("Show Status", for: .normal)
         setStatusButton.backgroundColor = .systemBlue
         setStatusButton.translatesAutoresizingMaskIntoConstraints = false
         return setStatusButton
         
     }()
     
     
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


     @objc func buttonPressed() {
             print("Current status - \(String(describing: statusLabel.text))")
         }

     

     func setupLayout() {
         self.addSubview(avatarImageView)
         self.addSubview(fullNameLabel)
         self.addSubview(statusLabel)
         self.addSubview(setStatusButton)


            NSLayoutConstraint.activate([
                     avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                     avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                     avatarImageView.heightAnchor.constraint(equalToConstant: 120),
                     avatarImageView.widthAnchor.constraint(equalToConstant: 120),
                     
                     
                     fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                     fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                     fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
             
                     
                     statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
                     statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                     statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
                     
                     
                     setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
                     setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                     setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                     setStatusButton.heightAnchor.constraint(equalToConstant: 50)
                
                 ])
              
             }
            
 }
