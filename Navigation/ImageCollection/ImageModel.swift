//
//  ImageModel.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 24.04.2023.
//

import UIKit

struct ImageModel {
    
    let image: UIImage
    
    static func makeImage() -> [ImageModel] {
        var imageCollection = [ImageModel]()
        
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_1")!))
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_2")!))
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_3")!))
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_4")!))
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_5")!))
        imageCollection.append(ImageModel(image: UIImage(named:"photo_collection_6")!))
        return imageCollection
        
    }
}
