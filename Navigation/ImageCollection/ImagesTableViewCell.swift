//
//  ImagesTableViewCell.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 24.04.2023.
//

import UIKit

protocol ImagesTableViewCellDelegate: AnyObject {
    func delegateButtonAction(cell: ImagesTableViewCell)
}

class ImagesTableViewCell: UITableViewCell {
    
    weak var delegate: ImagesTableViewCellDelegate?
    
    private lazy var imagesLabel: UILabel = {
        let imagesLabel = UILabel()
        imagesLabel.translatesAutoresizingMaskIntoConstraints = false
        imagesLabel.backgroundColor = .white
        imagesLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        imagesLabel.textColor = .black
        return imagesLabel
        
    }()
    
    private lazy var  firstImageView: UIImageView = {
        let firstImageView = UIImageView()
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.layer.cornerRadius = 6
        firstImageView.clipsToBounds = true
        return firstImageView
    }()
    
    
    private lazy var  secondImageView: UIImageView = {
        let secondImageView = UIImageView()
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.contentMode = .scaleAspectFill
        secondImageView.layer.cornerRadius = 6
        secondImageView.clipsToBounds = true
        return secondImageView
    }()
    
    
    private lazy var  thirdImageView: UIImageView = {
        let thirdImageView = UIImageView()
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdImageView.contentMode = .scaleAspectFill
        thirdImageView.layer.cornerRadius = 6
        thirdImageView.clipsToBounds = true
        return thirdImageView
    }()
    
    private lazy var  fourthImageView: UIImageView = {
        let fourthImageView = UIImageView()
        fourthImageView.translatesAutoresizingMaskIntoConstraints = false
        fourthImageView.contentMode = .scaleAspectFill
        fourthImageView.layer.cornerRadius = 6
        fourthImageView.clipsToBounds = true
        return fourthImageView
    }()
    
    
    private lazy var arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        arrowButton.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        return arrowButton
    }()
    
    
    @objc private func buttonAction() {
        delegate?.delegateButtonAction(cell: self)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ imageStruct: ImageStructProfile) {
        imagesLabel.text = imageStruct.name
        firstImageView.image = imageStruct.imageFirst
        secondImageView.image = imageStruct.imageOne
        thirdImageView.image = imageStruct.imageTwo
        fourthImageView.image = imageStruct.imageThree
    }
    
    private func layout() {
        
        [imagesLabel, firstImageView, secondImageView, thirdImageView, fourthImageView, arrowButton].forEach { contentView.addSubview($0) }
        
        let photoCountPerRow = 4
        let photoSpacing: CGFloat = 8
        let aspectRatio: CGFloat = 3.0 / 4.0
        let availableWidth = UIScreen.main.bounds.width - CGFloat(photoCountPerRow - 1) * photoSpacing
        let imageSize = CGSize(width: availableWidth / CGFloat(photoCountPerRow), height: availableWidth / CGFloat(photoCountPerRow) * aspectRatio)
    
        
        NSLayoutConstraint.activate([
            
            imagesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            imagesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            
            firstImageView.topAnchor.constraint(equalTo: imagesLabel.bottomAnchor, constant: 12),
            firstImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: photoSpacing),
            firstImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            firstImageView.heightAnchor.constraint(equalToConstant: imageSize.height),
            firstImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
            
            secondImageView.topAnchor.constraint(equalTo: imagesLabel.bottomAnchor, constant: 12),
            secondImageView.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor, constant: photoSpacing),
            secondImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            secondImageView.heightAnchor.constraint(equalToConstant: imageSize.height),
            secondImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
            
            
            thirdImageView.topAnchor.constraint(equalTo: imagesLabel.bottomAnchor, constant: 12),
            thirdImageView.leadingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: photoSpacing),
            thirdImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            thirdImageView.heightAnchor.constraint(equalToConstant: imageSize.height),
            thirdImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
            
            fourthImageView.topAnchor.constraint(equalTo: imagesLabel.bottomAnchor, constant: 12),
            fourthImageView.leadingAnchor.constraint(equalTo: thirdImageView.trailingAnchor, constant: photoSpacing),
            fourthImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            fourthImageView.heightAnchor.constraint(equalToConstant: imageSize.height),
            fourthImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
            
            
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            arrowButton.widthAnchor.constraint(equalToConstant: 24),
            arrowButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
}


