//
//  ChannelVC.swift
//  slack
//
//  Created by elliott chavis on 4/21/22.
//

import UIKit

class ChannelVC: UIViewController {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    private let slackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.textColor = .white
        label.text = "Slack"
        return label
    }()
    
    private let channelsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 18)
        label.text = "Channels"
        label.textColor = .white
        return label
    }()
    
    private lazy var addChannelButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "addChannelButton"), for: .normal)
        return button
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profileDefault")
        return iv
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showLoginVC), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
            configureGradientLayer()
            configureUI()
            
        }
    
    // MARK: - Actions
    
    @objc func showLoginVC() {
        let controller = LoginVC()
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(slackLabel)
        slackLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 12, paddingLeft: 30)
        
        view.addSubview(channelsLabel)
        channelsLabel.anchor(top: slackLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 30)
        
        view.addSubview(addChannelButton)
        addChannelButton.anchor(top: slackLabel.bottomAnchor, left: channelsLabel.rightAnchor, paddingTop: 50, paddingLeft: 120)
        
        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingLeft: 30, paddingBottom: 30)
        imageView.setDimensions(height: 75, width: 75)
        
        view.addSubview(loginButton)
        loginButton.centerY(inView: imageView)
        loginButton.anchor(left: imageView.rightAnchor, paddingLeft: 30)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: addChannelButton.bottomAnchor).isActive = true
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ChannelVC: UIViewControllerTransitioningDelegate {
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            PresentationController(presentedViewController: presented, presenting: presenting)
        }
}
    
    

