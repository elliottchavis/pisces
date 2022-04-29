//
//  AppDelegate.swift
//  slack
//
//  Created by elliott chavis on 4/20/22.
//

import UIKit
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // swRevealContainer
    var swContainer : SWRevealViewController?
    
    // main navigaion controller
    var navigationController : UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        guard #available(iOS 13, *) else {
                    window = UIWindow(frame: UIScreen.main.bounds)
                    
                    //instantiate SWRevealController
                    swContainer = SWRevealViewController()
                    
                    /// frontViewController
                    let frontVC = ChatVC()
                    
                    /// menuViewController
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
                    
                    return true
                    
                }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

