//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 23.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    var avatar: UIImageView {
        let image = UIImageView(image: UIImage(named: "ImageAcon"))
        image.frame = CGRect(x: 16, y: 16, width: 130, height: 120)
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 60.0
        image.backgroundColor = UIColor.systemPink.withAlphaComponent(0.3)
        image.clipsToBounds = true
        return image
       
    }
    
    
    var label: UILabel  {
        let label = UILabel(frame:CGRect(x: 160, y: 27, width: 150, height: 20))
        label.text = "Hipster Lion"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
        
    }
    
    
    var label1: UILabel  {
        let label1 = UILabel(frame:CGRect(x: 160, y: 80, width: 200, height: 20))
        label1.text = "Waiting for something..."
        label1.font = UIFont.boldSystemFont(ofSize: 16.0)
        label1.textColor = .gray
        return label1
        
    }
    
    

    
    var button: UIButton {
        let button = UIButton(frame: CGRect(x: 12, y: 170, width: 370, height: 50))
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 14
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSizeMake(4.0, 4.0)
        button.setTitle("Show Status", for: .normal)
        button.backgroundColor = .systemBlue
        return button
        
    }

    

    
    init() {
        
        super.init(frame: .zero)
        addSubview(button)
        addSubview(avatar)
        addSubview(label)
        addSubview(label1)
        backgroundColor = .lightGray.withAlphaComponent(0.3)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonPressed() {
        print("Current status - \(String(describing: label1.text))")
    }

}

