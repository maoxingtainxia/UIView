//
//  AppDelegate.m
//  05 Animation
//
//  Created by Rodolfo on 16/1/7.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
   
    UIView *_view;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //就是让window在屏幕上直接显示出来，这是window的特性，不同于普通的view，不需要添加到另一个视图上
    [self.window makeKeyAndVisible];
    
    //创建view
    _view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _view.backgroundColor = [UIColor greenColor];
    [self.window addSubview:_view];
    
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(0, 20, 100, 40);
    button.backgroundColor = [UIColor redColor];
    
    /*
     UIControlEventTouchUpInside 点击事件名
     点击按钮之后，系统响应buttonAction事件
     */
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];

    [self.window addSubview:button];
    
    return YES;
}

//按钮响应事件
- (void)buttonAction {
   
    //1.移动的动画
    //    _view.frame.origin.x += 20;   //错误
    
    //    CGRect rect = _view.frame;
    //    rect.origin.y += 200;
    //    _view.frame = rect;
    
//    //开始动画
//    [UIView beginAnimations:@"animation1" context:NULL];    //一个界面动画多的话，通过名字进行区分
//    //设置动画持续时间
//    [UIView setAnimationDuration:2];
//    
//    //此处写动画执行的效果
//    CGRect rect = _view.frame;
//    rect.origin.y += 200;
//    _view.frame = rect;
//    
//    //提交动画
//    [UIView commitAnimations];
    
    //2.透明度动画、旋转动画
    _view.alpha = 1;
    //一个界面动画多的话，通过名字进行区分
    [UIView beginAnimations:@"animation2" context:NULL];
    //设置动画持续时间
    [UIView setAnimationDuration:2];
    
    //设置动画次数
    [UIView setAnimationRepeatCount:5];
    
    //设置动画演示速度（默认：前后慢，中间快）
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];    //curve：曲线
    
    //透明度变化
    //    _view.alpha = 0;
    
    //设置动画代理对象，进行方法的回调
    [UIView setAnimationDelegate:self];
    //设置动画接收之后调用的方法（该方法为动画结束后调用的方法，一般带以下三个参数）
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    //旋转吧，小宇宙
    _view.transform = CGAffineTransformRotate(_view.transform, M_PI);
    
    //提交动画
    [UIView commitAnimations];
    
}

//动画结束后代理调用的回调方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag context:(void *)context {
   
    NSLog(@"动画结束");
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
