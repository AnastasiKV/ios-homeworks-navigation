//
//  MyImageCollectionViewCell.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 24.04.2023.
//

import UIKit

class MyImageCollectionViewCell: UICollectionViewCell {
    
    private lazy var imagesView: UIImageView = {
        let imagesView = UIImageView()
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        imagesView.contentMode = .scaleAspectFill
        imagesView.clipsToBounds = true
        return imagesView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell( _ imageCollection: ImageModel) {
        imagesView.image = imageCollection.image
    }
    
    private func layout() {
        contentView.addSubview(imagesView)
        
        NSLayoutConstraint.activate([
            imagesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
