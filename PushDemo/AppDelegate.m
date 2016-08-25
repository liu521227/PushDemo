//
//  AppDelegate.m
//  PushDemo
//
//  Created by 秦 on 16/8/19.
//  Copyright © 2016年 秦. All rights reserved.
//

#import "AppDelegate.h"
#import "PushViewController.h"
#import "NSObject+Tool.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    //这里要注意下 UIApplicationLaunchOptionsRemoteNotificationKey 为远程推送
    //UIApplicationLaunchOptionsLocalNotificationKey为本地推送 别忘记修改
    UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    NSLog(@"localNotif= = %@", localNotif);
    if (localNotif) {
        self.userInfo = localNotif.userInfo;
//        if ([localNotif.userInfo[@"type"] isEqual:@"1"]) {
//            [self performSelector:@selector(pushComingViewController) withObject:nil afterDelay:2.0f];
//        }

    }
   
    return YES;
}

- (void)pushComingViewController{
    
    PushViewController *vc = [[PushViewController alloc] init];
    [[self currentViewController].navigationController pushViewController:vc animated:YES];
}

// 本地通知回调函数，当应用程序在前台时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"noti:%@",notification);

    if ([notification.userInfo[@"type"] isEqual:@"1"]) {
        PushViewController *vc = [[PushViewController alloc] init];
        [[self currentViewController].navigationController pushViewController:vc animated:YES];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
