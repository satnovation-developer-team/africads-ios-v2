//
//  AppDelegate.swift
//  Afric Ads
//
//  Created by apple on 17/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SideMenuSwift
import GoogleSignIn
import FacebookCore





@UIApplicationMain
class AppDelegate: UIResponder,UIApplicationDelegate {
   
    
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//
//           print("User Has Disconnected")
//       }

    
    

//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//
//
//       }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        SideMenuController.preferences.basic.direction = .left
        GIDSignIn.sharedInstance().clientID = "40496715654-hpqkdhc4naqgs3k9lrr96q191a0ke4ur.apps.googleusercontent.com"
      
        //SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }    //com.googleusercontent.apps.541278307590-7j1i56n9rn5fk8igu7s5dolfvblv9chu

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }

    
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//           if let error = error {
//
//               print("\(error.localizedDescription)")
//
//
//           }else{
//
//               // Perform any operations on signed in user here.
//               let userId = user.userID                  // For client-side use only!
//               let idToken = user.authentication.idToken // Safe to send to the server
//               let fullName = user.profile.name
//               let givenName = user.profile.givenName
//               let familyName = user.profile.familyName
//               let email = user.profile.email
//               print(fullName!)
//               print(email!)
//
//           //let userReferenceCode = jsonResponse["referenceCode"] as! String
//            // let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
//
//           }
//
//       }
    
    
    
    
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

