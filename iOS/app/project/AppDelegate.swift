//
//  AppDelegate.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var childAppDelegate: UIApplicationDelegate? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        setupWindow(navigationController: nav)
        return self.childAppDelegate?.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false
    }

    func setupWindow(navigationController:UINavigationController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)


        navigationController.isNavigationBarHidden = true
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
    }

}
