//
//  SignUpVC.swift
//  slack
//
//  Created by elliott chavis on 4/24/22.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "multiply"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.addTarget(self, action: #selector(dismissSignUpVC), for: .touchUpInside)
        return button
    }()
    
    private let imageViewOne: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "pisces_icon")
        return iv
    }()
    
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 45)
        label.text = "signup"
        label.textColor = .black
        return label
    }()
    
    private lazy var usernameContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "person"), textField: usernameTextField)
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        let containerView = InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
        containerView.backgroundColor = .clear
        return containerView
    }()
    
    private let usernameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        txt.textColor = .white
        return txt
    }()
    
    private let emailTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email"
        txt.textColor = .white
        return txt
    }()
    
    private let passwordTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.isSecureTextEntry = true
        txt.textColor = .white

        return txt
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setHeight(height: 50)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = false
        //button.addTarget(self, action: #selector(handleLogin),for: .touchUpInside)
        return button
    }()
    
    private let haveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "Login", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.darkGray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(dismissSignUpVC), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func dismissSignUpVC() {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.backgroundColor = .white
        view.makeCorner(withRadius: 30)

        
        view.addSubview(exitButton)
        exitButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingRight: 30)
        exitButton.setDimensions(height: 75, width: 75)
        
        view.addSubview(imageViewOne)
        imageViewOne.anchor(top: exitButton.bottomAnchor, left: view.leftAnchor ,paddingTop: 30, paddingLeft: 80)
        imageViewOne.setDimensions(height: 75, width: 75)
        
        view.addSubview(signUpLabel)
        signUpLabel.centerY(inView: imageViewOne)
        signUpLabel.anchor(left: imageViewOne.rightAnchor, paddingLeft: 15)
        
        let stack = UIStackView(arrangedSubviews: [usernameContainerView, emailContainerView, passwordContainerView, signUpButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imageViewOne.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(haveAccountButton)
        haveAccountButton.anchor( left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 32, paddingRight: 32)
        
    }
 
}
