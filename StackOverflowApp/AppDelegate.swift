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
        let storyboard = UIStoryboard(name: "MainNavigationController", bundle: .main)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        let resultsController = StackOverflowTableViewController()
        navigationController?.viewControllers = [resultsController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        configureConstantAppearances()
        return true
    }
    
    private func configureConstantAppearances() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.primaryBlueColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
        
    }

}

