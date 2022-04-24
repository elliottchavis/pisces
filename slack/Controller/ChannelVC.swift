//
//  ChannelVC.swift
//  slack
//
//  Created by elliott chavis on 4/21/22.
//

import UIKit

class ChannelVC: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            view.backgroundColor = .purple
        }
}

extension ChannelVC: UIViewControllerTransitioningDelegate {
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            PresentationController(presentedViewController: presented, presenting: presenting)
        }
}
    
    

