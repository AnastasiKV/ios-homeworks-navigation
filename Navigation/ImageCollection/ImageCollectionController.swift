//
//  ImageCollectionController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 24.04.2023.
//

import UIKit


class ImageCollectionController: UIViewController {
    
    private let allImages: [ImageModel] = ImageModel.makeImage()
    
    
    private lazy var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.clipsToBounds = true
        imageCollectionView.register(MyImageCollectionViewCell.self, forCellWithReuseIdentifier: MyImageCollectionViewCell.identifier)
        
        return imageCollectionView
    }()
    
    private let imageScreenView: UIView = {
        let imageScreenView = UIView()
        imageScreenView.translatesAutoresizingMaskIntoConstraints = false
        imageScreenView.backgroundColor = .black
        imageScreenView.alpha = 0.0
        return imageScreenView
    }()
    
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var crossImageView: UIImageView = {
        let crossImageView = UIImageView()
        crossImageView.translatesAutoresizingMaskIntoConstraints = false
        crossImageView.isUserInteractionEnabled = true
        crossImageView.image = UIImage(systemName: "multiply")
        crossImageView.tintColor = .white
        crossImageView.alpha = 0.0
        let tapCrossGesture = UITapGestureRecognizer(target: self, action: #selector(tapCrossAction))
        crossImageView.addGestureRecognizer(tapCrossGesture)
        return crossImageView
    }()
    
    @objc private func tapCrossAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.navigationController?.isNavigationBarHidden = false
                self.crossImageView.alpha = 0.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5) {
                self.imageView.alpha = 0.0
                self.imageScreenView.alpha = 0.0
            }
        }
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "All Images"
        view.backgroundColor = .white
        setCollectionView()
        layout()
        
    }
    
    private func setCollectionView() {
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
    }
    
    
    private func layout() {
        
        [imageCollectionView, imageScreenView, imageView, crossImageView].forEach {view.addSubview($0)}
        
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            imageScreenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageScreenView.topAnchor.constraint(equalTo: imageCollectionView.topAnchor),
            imageScreenView.bottomAnchor.constraint(equalTo: imageCollectionView.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo:imageScreenView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageScreenView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: imageScreenView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageScreenView.widthAnchor),
            
            crossImageView.bottomAnchor.constraint(equalTo: imageView.topAnchor,constant: -20),
            crossImageView.trailingAnchor.constraint(equalTo: imageScreenView.trailingAnchor, constant: -20)
            
        ])
    }
    
}


extension ImageCollectionController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: MyImageCollectionViewCell.identifier, for: indexPath) as!MyImageCollectionViewCell
        cell.setupCell(allImages[indexPath.item])
        return cell
    }
}



extension ImageCollectionController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (imageCollectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageView.image = allImages[indexPath.item].image
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.navigationController?.isNavigationBarHidden = true
                self.imageScreenView.alpha = 0.7
                self.imageView.alpha = 1.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.crossImageView.alpha = 1.0
                
            }
        }
    }
}






