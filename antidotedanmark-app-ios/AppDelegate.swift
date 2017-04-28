//
//  AppDelegate.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		setupAppearance()
		
		return true
	}
	
	func setupAppearance() {
		let adBackgroundColor = UIColor.darkGray
		let adBackgroundColorDark = UIColor.darkGray
		let adTitleColor = UIColor.white
		let adYellowColor = UIColor(red: 255/266, green: 201/255, blue: 66/255, alpha: 1.0)
		
		UINavigationBar.appearance().backgroundColor = adBackgroundColor
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().tintColor = adYellowColor
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: adTitleColor]
		UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -70), for: UIBarMetrics.default)
		UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
//		UINavigationBar.appearance().setBarStyle:UIBarStyleBlack]
//		UINavigationBar.appearance().setTranslucent:NO]
//		UINavigationBar.appearance().setOpaque:YES]
		
//		UINavigationBar.appearance().setTitleTextAttributes:
//			[NSDictionary dictionaryWithObjectsAndKeys:
//			[UIColor ti_navigationBarTitleTextColor],
//			NSForegroundColorAttributeName,
//			[UIFont ti_primaryFontWithSize:18.0f],
//			NSFontAttributeName,
//			nil]]
//		
//		UINavigationBar.appearance().setBackIndicatorImage:kImgBack]
//		UINavigationBar.appearance().setBackIndicatorTransitionMaskImage:kImgBack]
		
		// hide globally the back text in navigation bar
//		[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -70.f) forBarMetrics:UIBarMetricsDefault]
//		
//		// Replace the 'Cancel' button in a search bar with a white cross globally
//		[[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
//			setTitle:@""]
//		[[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
//			setImage:[UIImage imageNamed:@"white_cross_icon"]]
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
		// Called as part of the transition from the background to the active state here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

