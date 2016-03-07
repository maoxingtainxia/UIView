//
//  AppDelegate.m
//  02 Homework--七色
//
//  Created by Rodolfo on 16/1/8.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
   
    //创建全局数组，存放7个view
    NSMutableArray *views;
    
    int time;
    
    UIButton *button;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    //开辟空间
    views = [[NSMutableArray alloc] initWithCapacity:7];
    
    for (int i = 0; i < 7; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(80, 150, 220, 220)];
        [self.window addSubview:view];
        
        //获取前一次创建的视图
        UIView *lastView = [views lastObject];
        if (lastView != nil) {
            //当前视图的尺寸，在上一个视图的基础上缩小0.8
            view.transform = CGAffineTransformScale(lastView.transform, 0.8, 0.8);
        }
        
        //将视图添加到数组中
        [views addObject:view];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil repeats:YES];

    
    //创建button
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor blueColor];
    button.frame = CGRectMake(140, 500, 100, 40);
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    
    return YES;
}

//定时器方法
- (void)timerAction:(NSTimer *)timer {
   
    //开始配置动画
    [UIView beginAnimations:nil context:nil];
    //动画时间与题意时间无关
    [UIView setAnimationDuration:.6];
    
    //上颜色，旋转
    for (int i = 0; i < views.count; i++) {
        UIView *view = [views objectAtIndex:i];
        
        //设置背景颜色，三色随机产生（三色范围是0--1）
        view.backgroundColor = [UIColor colorWithRed:rand()%10*0.1 green:rand()%10*0.1 blue:rand()%10*0.1 alpha:1];
        
        //旋转
        view.transform = CGAffineTransformRotate(view.transform, 3.14/10);
    }
    
    //提交动画
    [UIView commitAnimations];
    
    //通过全局变量控制时间
    time++;
    if (time == 10) {
        //移除视图
        for (UIView *subView in views) {
            [subView removeFromSuperview];
        }
        
        [button removeFromSuperview];
    }
}

- (void)buttonAction {
   
    for (UIView *subView in views) {
        subView.transform = CGAffineTransformScale(subView.transform, 0.7, 0.7);
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
