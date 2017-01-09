# YM3DTouch
3D touch demo  for peek and pop and home screen quick action features
# Introduction
- With iOS 9, new iPhone models add a third dimension to the user interface.
- A user can now press your Home screen icon to immediately access functionality provided by your app.
- Within your app, a user can now press views to see previews of additional content and gain accelerated access to features.
- Apple's own apps mostly use 3D Touch for getting a little preview of the next thing you want to do. 
So if you're on the home screen, hard press on an icon to get a few shortcuts directly into a section of the app.

- If you want to your app more interactive to add 3D touch in your application  
 
- Two major 3D touch features need to add your app.

	1.	Peek and Pop
	2.	Quick Actions
	
  # 1.	Implement Peek and Pop :
    A. Storyboard -> Using  Segue : (On cell Selection)
		- create simple list screen as per your requirement. I already created below screen that contain tableview with simple cell
    
    ![Toast message](https://github.com/yudiz-solutions/YM3DTouch/blob/master/Screenshorts/list.png)
    
    Add Peek and Pop using storyboard 
    
    ![Toast message](https://github.com/yudiz-solutions/YM3DTouch/blob/master/Screenshorts/set-segue.gif)
    
    # Add preview actions
    
    ```
    func addMenuItems(menu:String ...) -> [UIPreviewActionItem] {
        var arrPreview = [UIPreviewActionItem]()
        for m in menu {
            let likeAction = UIPreviewAction(title:m, style: .default) { (action, viewController) -> Void in
                print(action.title)
            }
            arrPreview.append(likeAction)
        }
        return arrPreview
    }
	
	// Add Action of preview
    override var previewActionItems: [UIPreviewActionItem] {
        return self.addMenuItems(menu: "Open","Bookmark")
    }
    
    ```
    
   # Peek & Pop Output
   ![Toast message](https://github.com/yudiz-solutions/YM3DTouch/blob/master/Screenshorts/peek%20and%20pop.png)
  
 # 2.Implement Quick Action :
 
  - create a UIApplicationShortcutItems array. This is where we define what the actions are, the title, subtitle, and short cut keys, icon , dictionary.
 Note that you can only have a max of 4 quick actions off the icon in your app.

A. Dynamic Quick Action 

type : A required string delivered to your app when the user invokes the corresponding quick action.
localizedTitle :  A required string displayed to the user on the Home screen as the name of the quick action.
localizedSubtitle : An optional string that is displayed to the user on the Home screen, immediately below the corresponding title string.
icon :  	An optional string specifying the type of an icon from the system-provided api. full list of the icons https://developer.apple.com/reference/uikit/uiapplicationshortcuticontype. we can also set custom icon.
userInfo :  An optional, app-defined dictionary. 

```
1. AppDelegate.swift

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.shortcutItems = getAppShortcut()
        return true
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

```

- when user tap on any quick action below method will call. you can navigate specific screen as per your requirement.

```
func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
}
```

# Quick Action Output: 

![Toast message](https://github.com/yudiz-solutions/YM3DTouch/blob/master/Screenshorts/quick%20action%20.png)


A. Static Quick Action (Info.plist) 

 - home screen quick actions using the UIApplicationShortcutItems array in the app Info.plist file

1. Info.plist :

![Toast message](https://github.com/yudiz-solutions/YM3DTouch/blob/master/Screenshorts/plist%20screen%20short.png)

- add this key into you info.plist file

```
<key>UIApplicationShortcutItems</key>
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
```







   

  
