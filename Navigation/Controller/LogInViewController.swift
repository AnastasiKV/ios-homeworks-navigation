//
//  LogInViewController.swift
//  Navigation
//
//  Created by Anastasiia Kulikova on 07.03.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    private let notification = NotificationCenter.default
    private var topButtonConstraint: NSLayoutConstraint?
    
    
    private let logScrollView: UIScrollView = {
        let logScrollView = UIScrollView()
        logScrollView.translatesAutoresizingMaskIntoConstraints = false
        return logScrollView
    }()
    
    
    private let logoStackView: UIStackView = {
        let logoStackView = UIStackView()
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        logoStackView.axis = .vertical
        logoStackView.distribution = .fillProportionally
        logoStackView.layer.cornerRadius = 10
        logoStackView.layer.borderWidth = 0.5
        logoStackView.layer.borderColor = UIColor.lightGray.cgColor
        logoStackView.clipsToBounds = true
        return logoStackView
        
    }()
    
    
    private let logoLineView: UIView = {
        let logoLineView = UIView()
        logoLineView.translatesAutoresizingMaskIntoConstraints = false
        logoLineView.backgroundColor = .lightGray
        return logoLineView
        
    }()
    
    
    private var logoImage: UIImageView = {
        $0.image = UIImage(named: "ImageLogo")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    private lazy var loginArea: UITextField = {
        let loginArea = UITextField()
        loginArea.translatesAutoresizingMaskIntoConstraints = false
        loginArea.backgroundColor = .systemGray6
        loginArea.autocapitalizationType = .none
        loginArea.textColor = .black
        loginArea.tag = 0
        loginArea.returnKeyType = .continue
        loginArea.delegate = self
        loginArea.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginArea.tintColor = UIColor(named: "AccentColor")
        loginArea.placeholder = "Email or phone"
        loginArea.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        return loginArea
    }()
    
    
    private lazy var passwordArea: UITextField = {
        let passwordArea = UITextField()
        passwordArea.translatesAutoresizingMaskIntoConstraints = false
        passwordArea.isSecureTextEntry = true
        passwordArea.backgroundColor = .systemGray6
        passwordArea.autocapitalizationType = .none
        passwordArea.textColor = .black
        passwordArea.delegate = self
        passwordArea.tag = 1
        passwordArea.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordArea.tintColor = UIColor(named: "AccentColor")
        passwordArea.clipsToBounds = true
        passwordArea.returnKeyType = .done
        passwordArea.placeholder = "Password"
        passwordArea.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        
        return passwordArea
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor(named: "blue_pixel")
        button.addTarget(self, action: #selector(clickButtonToProfile), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var messageLabel: UILabel = {
        let message = UILabel()
        message.textColor = .black
        message.isHidden = true
        message.font = UIFont(name: "Helvetica-Regular", size: 14)
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logScrollView.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        layout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            logScrollView.contentInset.bottom = keyboardSize.height
            logScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    
    @objc private func keyboardWillHide() {
        logScrollView.contentInset = .zero
        logScrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    func isPasswordCorrect(userPassword : String) -> Bool {
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{6,}$")
        return password.evaluate(with: userPassword)
    }
    
    
    func isLoginCorrect(userLogin: String) -> Bool {
        let loginRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let loginPred = NSPredicate(format:"SELF MATCHES %@", loginRegEx)
        return loginPred.evaluate(with: userLogin)
    }
    
    
    
    func layout() {
        view.addSubview(logScrollView)
        
        logScrollView.addSubview(logoStackView)
        logScrollView.addSubview(logoImage)
        logScrollView.addSubview(button)
        
        logoStackView.addArrangedSubview(loginArea)
        logoStackView.addArrangedSubview(logoLineView)
        logoStackView.addArrangedSubview(passwordArea)
        
        
        NSLayoutConstraint.activate([
            
            logScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            logScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            logoStackView.trailingAnchor.constraint(equalTo: logScrollView.trailingAnchor, constant: -16),
            logoStackView.leadingAnchor.constraint(equalTo: logScrollView.leadingAnchor, constant: 16),
            logoStackView.centerXAnchor.constraint(equalTo: logScrollView.centerXAnchor),
            logoStackView.heightAnchor.constraint(equalToConstant: 100),
            
            logoLineView.heightAnchor.constraint(equalToConstant: 0.5),
            logoLineView.leadingAnchor.constraint(equalTo: logoStackView.leadingAnchor),
            logoLineView.trailingAnchor.constraint(equalTo: logoStackView.trailingAnchor),
            
            logoImage.topAnchor.constraint(equalTo: logScrollView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: self.logoStackView.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: self.logoStackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.trailingAnchor.constraint(equalTo: logScrollView.trailingAnchor, constant: -16),
            button.leadingAnchor.constraint(equalTo: logScrollView.leadingAnchor,constant: 16)
            
        ])
    }
    
    
    @objc private func clickButtonToProfile() {
        
        let login = isLoginCorrect (userLogin: loginArea.text!)
        
        if (login == false) {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid email address or phone.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        let password = isPasswordCorrect (userPassword: passwordArea.text!)
        
        let errorMsg = "Password requires at least"
        
        if(password == false) {
            self.messageLabel.isHidden = false
            self.logScrollView.addSubview(self.messageLabel)
            self.topButtonConstraint?.isActive = false
            
        } else {
            
            self.messageLabel.removeFromSuperview()
            self.messageLabel.isHidden = true
        }
        
        if self.loginArea.text == "" {
            loginArea.shake()
        } else if passwordArea.text == "" {
            loginArea.shake()
        } else if self.loginArea.text == "iosdevelop@yandex.ru" && passwordArea.text == "qwerty19!FT" {
            
            
            let profileController = ProfileViewController ()
            navigationController?.pushViewController(profileController, animated: true)
            
            
        } else {
            
            let alertController = UIAlertController(title: "Password Error", message: errorMsg, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}


extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        logoStackView.endEditing(true)
        return true
    }
    
}

