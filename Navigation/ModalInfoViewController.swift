//
//  ModalInfoViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 08.02.2023.
//

import UIKit

class ModalInfoViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        
    let alert = UIAlertController(title: "Вы хотите изменить пост?", message: "Сделайте это действие, если уверены в своем решении", preferredStyle: .alert)
        
    
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler:{(alert: UIAlertAction!) in print("Да")}))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler:{(alert: UIAlertAction!) in print("Нет")}))

        
    self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func present(_ viewControllerToPresent: ModalInfoViewController,
                 animated flag: Bool,
                 completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
}
