//
//  AppDelegate.swift
//  Dictionary contakts
//
//  Created by MacBook on 08/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()



    let userListVC = ContactListVC()  //оборочивание
    let nc = UINavigationController(rootViewController: userListVC)
    window?.rootViewController = nc

        return true
    }
}

