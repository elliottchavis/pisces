//
//  SceneDelegate.swift
//  slack
//
//  Created by elliott chavis on 4/20/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // swRevealContainer
    var swContainer : SWRevealViewController?
        
    // main navigaion controller
    var navigationController : UINavigationController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        //setup window
                window = UIWindow(windowScene: scene)
                
                //instantiate SWRevealController
                swContainer = SWRevealViewController()
                
                // frontViewController
                let frontVC = ChatVC()
                
                // menuViewController
                let menuVC = ChannelVC()
                
                //set frontVC as root of navigationController
                navigationController = UINavigationController(rootViewController: frontVC)
                
                //set navigaitionController as frontViewController of SWRevealController
                swContainer?.frontViewController = navigationController
                
                //set menuController as rearViewController of SWRevealController
                swContainer?.rearViewController = menuVC
                
                //set swContainer as root of window
                window?.rootViewController = swContainer
                
                //make window key and visible
                window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

