//
//  SignUpViewController.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    //look up selector handleAddProfilePhoto
    
    private let profilePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action:#selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        let img = UIImage(systemName: "mail")
        let view = Utilities().inputContainerView(withImage: img!, text: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let img = UIImage(systemName: "lock")
        let view = Utilities().inputContainerView(withImage: img!, text: passwordTextField)
        return view
        
    }()
    
    private lazy var fullnameContainerView: UIView = {
        let img = UIImage(systemName: "person")
        let view = Utilities().inputContainerView(withImage: img!, text: fullnameTextField)
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        let img = UIImage(systemName: "person.crop.circle")
        let view = Utilities().inputContainerView(withImage: img!, text: usernameTextField)
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
    
    private let fullnameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Username")
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let signUp = UIButton(type: .system)
        signUp.backgroundColor = .cyan
        signUp.setTitle("Sign Up",for: .normal)
        signUp.setTitleColor(.purple, for: .normal)
        signUp.backgroundColor = .white
        signUp.heightAnchor.constraint(lessThanOrEqualToConstant: 40).isActive = true
        signUp.layer.cornerRadius = 5
        signUp.titleLabel?.font = UIFont.boldSystemFont(ofSize:15)
        signUp.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return signUp
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account ", " Sign In")
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignUp() {
        let controller = LogInViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleShowLogIn() {
        let controller = LogInViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleAddProfilePhoto() {
        present(imagePicker,animated: true,completion: nil)
    }
    func configureUI(){
        view.backgroundColor = .purple
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        view.addSubview(profilePhotoButton)
        profilePhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        profilePhotoButton.setDimensions(width: 100, height: 100)
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let stack = UIStackView(arrangedSubviews:[emailContainerView,passwordContainerView,fullnameContainerView,usernameContainerView,signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top:profilePhotoButton.bottomAnchor,left:view.leftAnchor,right:view.rightAnchor,paddingLeft: 32,paddingRight:32)
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 40,paddingRight: 40)    }

}
//MARK: UIImagePickerControllerDelegate

extension SignUpViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //allows to access the selected media
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        self.profilePhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        profilePhotoButton.layer.cornerRadius = 100 / 2
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.imageView?.contentMode = .scaleAspectFill
        profilePhotoButton.imageView?.clipsToBounds = true
        profilePhotoButton.layer.borderColor = UIColor.white.cgColor
        profilePhotoButton.layer.borderWidth = 2
        
        dismiss(animated: true, completion: nil)
    }
}
