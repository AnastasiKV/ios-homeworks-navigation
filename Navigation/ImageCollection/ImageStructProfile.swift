//
//  ImageStructProfile.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 24.04.2023.
//

import UIKit



struct ImageStructProfile {
    
    let name: String
    let imageFirst: UIImage
    let imageOne: UIImage
    let imageTwo: UIImage
    let imageThree: UIImage
    let imageFour: UIImage
    let imageFive: UIImage
    
    
    static func makeImageStruct() -> [ImageStructProfile] {
        var imageStruct = [ImageStructProfile]()
        imageStruct.append(ImageStructProfile(name: "Images", imageFirst: UIImage(named: "photo_collection_1")!, imageOne: UIImage(named: "photo_collection_2")!, imageTwo: UIImage(named: "photo_collection_3")!, imageThree: UIImage(named: "photo_collection_4")!, imageFour: UIImage(named: "photo_collection_5")!, imageFive: UIImage(named: "photo_collection_6")!))
        return imageStruct
    }
    
}
