//
//  AppDelegate.swift
//  StayAPT
//
//  Created by Macintosh on 22/08/17.
//  Copyright © 2017 Techximum. All rights reserved.
//

import UIKit
import IQKeyboardManager
import RevealingSplashView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        checkLoginState()
        setupKeyBoardManager()
        setupNavigationAppearance()
        setupSegmentedControlAppearance()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setupKeyBoardManager() {
      IQKeyboardManager.shared().isEnabled = true
    }
    
    func setupSegmentedControlAppearance() {
        let segmentedControlAppearance = UISegmentedControl.appearance()
        segmentedControlAppearance.tintColor = UIColor.red
        segmentedControlAppearance.setTitleTextAttributes([ NSFontAttributeName : UIFont(name: "cuyabra", size: 12.0)!], for: .normal)
    }
    
    func setupNavigationAppearance() {
        let navigationbarAppearance = UINavigationBar.appearance()
        //navigationbarAppearance.barStyle = .black
        //navigationbarAppearance.tintColor = UIColor.white
        //navigationbarAppearance.barTintColor = UIColor.red
       // navigationbarAppearance.shadowImage = nil
        navigationbarAppearance.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Javacom", size: 17.0)!]
    }
    
    func checkLoginState() {
        let member = LoginUtils.getCurrentMemberUserLogin()
        let fc = LoginUtils.getCurrentFitnessCenterUserLogin()
        
        if member != nil {
            setHomeMemberUserAsRVC()
        } else if fc != nil {
            setHomeFitnessCenterUserAsRVC()
        } else {
            setupSplash()
        }
    }
    
    func setHomeMemberUserAsRVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        setupSplash(vc: vc)
    }
    
    func setHomeFitnessCenterUserAsRVC() {
        let storyboard = UIStoryboard(name: "Fitness", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "FitnessHomeViewController")
        setupSplash(vc: vc)
    }
    
    func setHomeGuestAsRVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialViewController") as? UINavigationController
        window?.rootViewController = vc
    }
    
    func setupSplash(vc: UIViewController) {
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "stayapt-icon-red")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:204, green:0, blue:62, alpha:1.0))
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController?.view.addSubview(revealingSplashView)
        //Starts animation
        revealingSplashView.startAnimation(){
        }
    }
    
    func setupSplash() {
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "stayapt-icon-red")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:204, green:0, blue:57, alpha:1.0))
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "InitialViewController")
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController?.view.addSubview(revealingSplashView)
        //Starts animation
        revealingSplashView.startAnimation(){
            
        }
    }
}
