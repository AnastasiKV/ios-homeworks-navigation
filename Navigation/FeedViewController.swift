//
//  FeedViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

class FeedViewController: UIViewController {


    var post = Post (title: "My Post")


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        let button = UIButton(frame: CGRect(x: 150, y: 650, width: 110, height: 55))
        button.backgroundColor = .systemBlue
        button.setTitle("Go Post", for: .normal)
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)
      }

      @objc func buttonAction(sender: UIButton!) {
          let postViewController = PostViewController()
          self.navigationController?.pushViewController(postViewController, animated: true)

         
          
      }
}


