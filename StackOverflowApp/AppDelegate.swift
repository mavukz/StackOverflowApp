//
//  AppDelegate.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "StackOverflowTableViewScreen", bundle: .main)
        let controller = storyboard.instantiateInitialViewController()
        controller?.navigationController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }

}

