//
//  ChatVC.swift
//  slack
//
//  Created by elliott chavis on 4/21/22.
//


import UIKit

class ChatVC: UIViewController {
    
    
    // MARK: - Properties
    
    lazy var overlayView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        return view
    }()
    
    private lazy var menuBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "smackBurger"), for: .normal)
        button.addTarget(self, action: #selector(hamburgerClicked), for: .touchUpInside)
        return button
    }()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupNavBar()
        setupSWReveal()
    }
    
    // MARK: - Helpers
    
    func setupView(){                                                                // adds overlay view
        view.addSubview(overlayView)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        overlayView.alpha = 0
    }

    func setupNavBar(){
        navigationController?.navigationBar.isHidden = false
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
            let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
            currWidth?.isActive = true
            let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
            currHeight?.isActive = true
        
        navigationItem.leftBarButtonItem = menuBarItem
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupSWReveal(){
       //adding panGesture to reveal menu controller
        view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
       
       //adding tap gesture to hide menu controller
        view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        //setting reveal width of menu controller manually
        self.revealViewController()?.rearViewRevealWidth = UIScreen.main.bounds.width * (2/3)
        
        self.revealViewController()?.delegate = self
        
    }

    //MARK: - Actions
    
    @objc func hamburgerClicked(){
        //toggle frontVC on clicking hamburger menu
        self.revealViewController()?.revealToggle(animated: true)
    }
}


//MARK: - SWRevealController delegates

extension ChatVC: SWRevealViewControllerDelegate {
    
    //varying alpha of overlayView with progress of panGesture to reveal or hide menu view
    func revealController(_ revealController: SWRevealViewController!, panGestureMovedToLocation location: CGFloat, progress: CGFloat) {
        overlayView.alpha = progress
    }
    
    //animating alpha in case user just taps hamburger menu which directly change FrontViewPosition
    func revealController(_ revealController: SWRevealViewController!, animateTo position: FrontViewPosition) {
        
        //menu view is hidden
        if position == FrontViewPosition.left{
            overlayView.alpha = 0
        }

        //menu view is revealed
        if position == FrontViewPosition.right{
            overlayView.alpha = 1
        }
    }
}
