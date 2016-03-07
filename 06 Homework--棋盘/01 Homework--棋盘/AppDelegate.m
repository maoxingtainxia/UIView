//
//  AppDelegate.m
//  01 Homework--棋盘
//
//  Created by Rodolfo on 16/1/8.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //此处的点语法，与之前的get方法相对应
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIView *superView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 320, 320)];
    superView.backgroundColor = [UIColor grayColor];
    [self.window addSubview:superView];
    
    //for循环控制行数
    for (int i = 0; i < 16; i++) {
        
        //当偶数行的时候填充颜色
        if (i % 2 == 0) {
            
            //for循环控制列数
            for (int j = 0; j < 16; j++) {
                
                //偶数行，偶数列 填充黑色
                if (j % 2 == 0) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20*j, 20*i, 20, 20)];
                    view.backgroundColor = [UIColor blackColor];
                    [superView addSubview:view];
                }
                
                //偶数行，奇数列 填充红色
                if (j % 2 != 0) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20*j, 20*i, 20, 20)];
                    view.backgroundColor = [UIColor redColor];
                    [superView addSubview:view];
                }

            }
        }
        
        //当奇数行的时候填充颜色
        else {
            //for循环控制列数
            for (int j = 0; j < 16; j++) {
                
                //偶数行，偶数列 填充黑色
                if (j % 2 == 0) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20*j, 20*i, 20, 20)];
                    view.backgroundColor = [UIColor redColor];
                    [superView addSubview:view];
                }
                
                //偶数行，奇数列 填充红色
                if (j % 2 != 0) {
                    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20*j, 20*i, 20, 20)];
                    view.backgroundColor = [UIColor blackColor];
                    [superView addSubview:view];
                }
                
            }

        }
    }
    
    return YES;
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
