//
//  AppDelegate.m
//  01 UIWindow的使用
//
//  Created by Rodolfo on 16/1/6.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    //创建一个window
//    UIScreen *screen = [UIScreen mainScreen];
//    CGRect rect = [screen bounds];
//    //    CGRect rect = CGRectMake(0, 0, screen.bounds.size.width, screen.bounds.size.height);
//    self.window = [[UIWindow alloc] initWithFrame:rect];
    
    //以下代码等价于上方代码
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor redColor];
    //就是让window在屏幕上直接显示出来，这是window的特性，不同于普通的View，不需要添加到另一个视图上去显示
    [self.window makeKeyAndVisible];
    
    //#warning 新创建的window无法作为主窗口进行叠加显示（需改为非ARC模式，或将新建窗口作为全局属性）
    _win = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _win.backgroundColor = [UIColor greenColor];
    //显示_win窗口，但是不作为主窗口
    _win.hidden = NO;
    //错误，这样使得_win窗口为主窗口，这样self.window就不是主窗口了
    //    [_win makeKeyAndVisible];
    
    //窗口的优先级:Normal < StatusBar < Alert
    //windowLevel是显示的优先级，优先级高的显示在屏幕的上方
    _win.windowLevel = UIWindowLevelStatusBar;
    
    //此时不能将_win作为子视图添加到window上，这样优先级就不起作用了
    //    [self.window addSubview:_win];
    
    
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
