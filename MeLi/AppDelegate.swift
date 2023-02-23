//
//  AppDelegate.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 18/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator : MainCoordinator?
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        window?.rootViewController = LaunchViewController.instance(.onboarding)
//        window?.makeKeyAndVisible()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        coordinator = MainCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        coordinator?.start()
                
        window?.makeKeyAndVisible()
        return true
    }

}

