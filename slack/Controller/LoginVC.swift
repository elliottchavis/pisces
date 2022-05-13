//
//  LoginVC.swift
//  slack
//
//  Created by elliott chavis on 4/23/22.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "multiply"), for: .normal)
        //button.setImage(#imageLiteral(resourceName: "closeButton"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.addTarget(self, action: #selector(dismissLoginVC), for: .touchUpInside)
        return button
    }()
    
    private let imageViewOne: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "pisces_icon")
        return iv
    }()
    
    private let piscesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 45)
        label.text = "pisces"
        label.textColor = .black
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        let containerView = InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
        containerView.backgroundColor = .clear
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email"
        txt.textColor = .darkGray
        return txt
    }()
    
    private let passwordTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.isSecureTextEntry = true
        txt.textColor = .darkGray

        return txt
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setHeight(height: 50)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin),for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.darkGray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.makeCorner(withRadius: 30)
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func handleLogin() {
        
    }
    
    @objc func dismissLoginVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleShowSignUp() {
        let controller = SignUpVC()
        controller.modalPresentationStyle = .overCurrentContext
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(exitButton)
        exitButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingRight: 30)
        exitButton.setDimensions(height: 75, width: 75)
        
        view.addSubview(imageViewOne)
        imageViewOne.anchor(top: exitButton.bottomAnchor, left: view.leftAnchor ,paddingTop: 30, paddingLeft: 80)
        imageViewOne.setDimensions(height: 75, width: 75)
        
        view.addSubview(piscesLabel)
        piscesLabel.centerY(inView: imageViewOne)
        piscesLabel.anchor(left: imageViewOne.rightAnchor, paddingLeft: 15)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imageViewOne.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor( left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 32, paddingRight: 32)
        
        //emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        //passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

}
