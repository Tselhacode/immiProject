//
//  LogInViewController.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "location")
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(systemName: "mail")
        let view = Utilities().inputContainerView(withImage: image!,text: emailTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(systemName: "lock")
        let view = Utilities().inputContainerView(withImage: image!,text: passwordTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signInButton: UIButton = {
        let signIn = UIButton(type: .system)
        signIn.backgroundColor = .cyan
        signIn.setTitle("Sign In",for: .normal)
        signIn.setTitleColor(.purple, for: .normal)
        signIn.backgroundColor = .white
        signIn.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        signIn.layer.cornerRadius = 5
        signIn.titleLabel?.font = UIFont.boldSystemFont(ofSize:15)
        signIn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return signIn
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account? ", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    //MARK: -Selectors
    @objc func handleLogin() {
        let controller = TabBarViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleShowSignUp() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: -Helpers
    
    func configureUI() {
        view.backgroundColor = .purple
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        view.addSubview(logoImage)
        logoImage.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImage.setDimensions(width: 100, height: 100)
        
        let stack = UIStackView(arrangedSubviews:[emailContainerView,passwordContainerView,signInButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top:logoImage.bottomAnchor,left:view.leftAnchor,right:view.rightAnchor,paddingLeft: 32,paddingRight:32)
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 40,paddingRight: 40)
       
    }

}
