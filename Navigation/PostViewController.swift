//
//  PostViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Weekends"
    

    @IBAction func goInfo(_ sender: UIBarButtonItem) {
    present(ModalInfoViewController(), animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = titlePost
        
        
    let buttonInfo = UIBarButtonItem(title: "Info", style: .plain, target: self, action:  #selector(buttonAction))
    navigationItem.rightBarButtonItem = buttonInfo
        
    }
    
    @objc func buttonAction() {
        let buttonInfo1 = ModalInfoViewController()
        self.navigationController?.pushViewController(buttonInfo1, animated: true)

    
    }
}

 


