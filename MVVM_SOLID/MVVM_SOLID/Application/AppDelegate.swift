//
//  AppDelegate.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: Properties
    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?

    //MARK: Lifecycles
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize Window
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        // Initialize ApplicationCoordinator
        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.start()
        
        return true
    }
}
