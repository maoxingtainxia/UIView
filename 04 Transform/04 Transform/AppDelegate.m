//
//  AppDelegate.m
//  04 Transform
//
//  Created by Rodolfo on 16/1/6.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
   
    UIView *_view;
    
    //view视图原始的Transform
    CGAffineTransform _t;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //就是让window在屏幕上直接显示出来，这是window的特性，不同于普通的View，不需要添加到另一个视图上去显示
    [self.window makeKeyAndVisible];
    
    
    /*----------------------UIView的Transform的使用-------------------------*/
    _view = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 200, 200)];
    _view.backgroundColor = [UIColor redColor];
    [self.window addSubview:_view];
    
    //----------------------------------------------------------
    //添加一个button1，响应transform变化中的缩放
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];   //custom 习惯性、普通的
    button1.frame = CGRectMake(0, 20, 50, 30);
    button1.backgroundColor = [UIColor blueColor];
    
    //为按钮添加事件
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button1];
    
    //----------------------------------------------------------
    //添加一个button2，响应transform变化中的旋转
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];   //custom 习惯性、普通的
    button2.frame = CGRectMake(60, 20, 50, 30);
    button2.backgroundColor = [UIColor greenColor];
    
    //为按钮添加事件
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button2];

    //----------------------------------------------------------
    //添加一个button3，响应transform变化中的移动
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];   //custom 习惯性、普通的
    button3.frame = CGRectMake(120, 20, 50, 30);
    button3.backgroundColor = [UIColor cyanColor];
    
    //为按钮添加事件
    [button3 addTarget:self action:@selector(button3Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button3];

    //----------------------------------------------------------
    //添加button4，响应Transform变化之还原
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(180, 20, 50, 30);
    button4.backgroundColor = [UIColor yellowColor];
    [button4 addTarget:self action:@selector(button4Action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:button4];
    
    //记录_view视图的原始Transform
    _t = _view.transform;
    
    //作业用到的颜色随机变换
    //设置背景颜色,三色值随机产生(三色值的取值范围是0-1之间)
    //    视图.backgroundColor = [UIColor colorWithRed:rand()%10*.1 green:rand()%10*.1 blue:rand()%10*.1 alpha:1];
    
    return YES;
}

//按钮事件--响应尺寸的缩放
- (void)button1Action {
   
    //在原有基础Transform基础上，以中心点为中心，缩放 0.5 倍
    //1.缩放
    _t = CGAffineTransformScale(_t, 0.5, 0.5);
    
    //记录缩放后的Transform
    _view.transform = _t;
}

//按钮事件--响应旋转
- (void)button2Action {
   
    //2.旋转、顺时针
    _t = CGAffineTransformRotate(_t, M_PI/6);
    _view.transform = _t;
}

//按钮事件--响应移动
- (void)button3Action {
   
    //3、移动
    _t = CGAffineTransformTranslate(_t, 0, 100);
    _view.transform = _t;
}

//按钮事件--响应还原
- (void)button4Action {
   
    //4.还原
    //4.1 通过原始frame进行还原
    //    UIView *view = [self.window viewWithTag:<#(NSInteger)#>];
    _view.frame = CGRectMake(80, 80, 200, 200);
    
    //4.2 CGAffineTransformIdentity方法 ，自动保存了原始的Transform
//    _view.transform = CGAffineTransformIdentity;
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
