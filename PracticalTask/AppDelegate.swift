//
//  AppDelegate.swift
//  PracticalTask
//
//  Created by 2022M27 on 26/02/24.
//

import UIKit
import GoogleSignIn
import IQKeyboardManagerSwift
import FBSDKCoreKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        Settings.shared.isAdvertiserIDCollectionEnabled = true
        FirebaseApp.configure()
        let linkedInClientID = "291677320898-8isjbvmmd29tah93m2ufmatv7jiohb79.apps.googleusercontent.com"
        let config = GIDConfiguration.init(clientID: linkedInClientID)
        GIDSignIn.sharedInstance.configuration = config
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
    
    func application(_ app: UIApplication,open url: URL,options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            
            //URL Scheme Google
            GIDSignIn.sharedInstance.handle(url)
            
        }
}

