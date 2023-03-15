//
//  Post.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit


struct PostModel {
    
    let author: String
    let description: String
    let image: UIImage
    var likes: Int
    var views: Int
    
    
    static func makeMockPost() -> [[PostModel]] {
        var examplePost = [[PostModel]]()
        var section = [PostModel]()
        section.append(PostModel(author: "av.kulikovaa", description:  "Сегодня был прекрасный закат во время нашего отдыха", image: UIImage(named: "post_1")!, likes: 1543, views: 1346))
        section.append(PostModel(author: "travel_blog", description: "Самые лучшие места для фотографий в Куале-Лумпуре", image: UIImage(named: "post_2")!, likes: 14322, views: 15279))
        section.append(PostModel(author: "kotiki_meow", description: "It's so cute", image: UIImage(named: "post_3")!, likes: 25678, views: 27905))
        section.append(PostModel(author: "vkusvill", description: "Друзья, хотим напомнить, что в каталоге ВкусВилла вы можете найти приятные подарки, цветы, и конечно, торты с праздничным декором", image: UIImage(named: "post_4")!, likes: 4513, views: 5387))
        for _ in 0...5 {
           examplePost.append(section)
        }
          return examplePost

    }
}


    

        
    


