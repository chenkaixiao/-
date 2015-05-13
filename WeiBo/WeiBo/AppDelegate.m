//
//  AppDelegate.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "AppDelegate.h"
#import "KXTabBarViewController.h"
#import "KXNewFeatureViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 2 设置窗口的根控制器
    
    // 如何知道是否第一次使用这个版本
    NSString *versionKey = @"CFBundleVersion";
    versionKey = (__bridge NSString*)kCFBundleVersionKey;
    
    // 从沙河中 取出上一次存储的软件版本号
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    NSString  *lastVersion = [defaults objectForKey:versionKey];
    
    // 获得当前打开的软件版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    if([currentVersion isEqualToString:lastVersion]) //
    {
        self.window.rootViewController = [[KXTabBarViewController alloc]init];
    }else
    {
        self.window.rootViewController = [[KXNewFeatureViewController alloc]init];
        // 存储当前的版本号
        [defaults setObject:currentVersion forKey:versionKey];
        
        // 写入文件中
        [defaults synchronize];
    }
    
    // 3 显示页面

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
