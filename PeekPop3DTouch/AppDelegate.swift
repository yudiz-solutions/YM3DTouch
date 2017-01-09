//
//  AppDelegate.swift
//  PeekPop3DTouch
//
//  Created by Yudiz Solutions Pvt.Ltd. on 03/01/17.
//  Copyright © 2017 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

/*<key>UIApplicationShortcutItems</key>
 <array>
 <dict>
 <key>UIApplicationShortcutItemIconType</key>
 <string>UIApplicationShortcutIconTypeSearch</string>
 <key>UIApplicationShortcutItemSubtitle</key>
 <string>shortcutSubtitle1</string>
 <key>UIApplicationShortcutItemTitle</key>
 <string>shortcutTitle1</string>
 <key>UIApplicationShortcutItemType</key>
 <string>$(PRODUCT_BUNDLE_IDENTIFIER).First</string>
 <key>UIApplicationShortcutItemUserInfo</key>
 <dict>
 <key>firstShorcutKey1</key>
 <string>firstShortcutKeyValue1</string>
 </dict>
 </dict>
 </array>
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.shortcutItems = getAppShortcut()
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
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
    }
}


extension AppDelegate {
    
    func getAppShortcut() -> [UIApplicationShortcutItem] {
        
        return [ UIApplicationShortcutItem(type:"id_create",
                                    localizedTitle:"Create",
                                    localizedSubtitle:"create new item",
                                    icon:UIApplicationShortcutIcon(type: .add),
                                    userInfo:nil) ,
                 
                 UIApplicationShortcutItem(type:"id_like",
                                           localizedTitle:"Like",
                                           localizedSubtitle:"view your favorites",
                                           icon:UIApplicationShortcutIcon(type: .favorite),
                                           userInfo:nil) ,
            
                UIApplicationShortcutItem(type:"id_search",
                                      localizedTitle:"Search",
                                      localizedSubtitle: nil,
                                      icon:UIApplicationShortcutIcon(type: .search),
                                      userInfo:nil) ,
                
                UIApplicationShortcutItem(type:"id_search1",
                                          localizedTitle:"Custom Icon",
                                          localizedSubtitle: nil,
                                          icon:UIApplicationShortcutIcon(templateImageName:"apple_logo"), // Custom Icon
                                          userInfo:nil),
           
        ]
        
    }
}

