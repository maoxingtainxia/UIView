//
//  AppDelegate.m
//  03 Window、Screen
//
//  Created by Rodolfo on 15/10/9.
//  Copyright (c) 2015年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*--------------------UIWindow的使用---------------------*/
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //如果以（0，0）作为原点，会被状态栏覆盖掉
    //状态栏固定高度：20
    UIWindow *statusWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 20, 375, 20)];
    //设置window的级别
    statusWindow.windowLevel = UIWindowLevelStatusBar;
    statusWindow.backgroundColor = [UIColor grayColor];
    
    //为其添加一个label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
    label.text = @"自定义的window";
    label.backgroundColor = [UIColor greenColor];
    [statusWindow addSubview:label];
    
    //添加的window默认是隐藏的，设置优先级不起作用，需设置隐藏性为NO
    //    statusWindow.windowLevel = UIWindowLevelAlert;
    
    //显示statusWindow
    statusWindow.hidden = NO;
    [self.window addSubview:statusWindow];
    
    
    /*-------------------------UIScreen的使用------------------------*/
    //UIScreen是一个单例类，因为只有一个屏幕
    UIScreen *screen = [UIScreen mainScreen];
    //获取屏幕尺寸
    CGRect bounds = screen.bounds;
    CGFloat width = bounds.size.width;
    CGFloat height = bounds.size.height;
    
    NSLog(@"width = %f",width);
    NSLog(@"height = %f",height);
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor grayColor];
    [self.window addSubview:view];
    
    CGRect bounds2 = view.bounds;
    //NSStringFromCGRect 将CGRect的x\y width height 拼成一个字符串
    NSString *bounds2String = NSStringFromCGRect(bounds2);
    NSLog(@"bounds2String = %@",bounds2String);
    
    
    /*-------------------------视图的层次结构------------------------*/
    //创建父视图
    UIView *superView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 375, 200)];
    superView.backgroundColor = [UIColor redColor];
    [self.window addSubview:superView];

    //    superView.tag = 100;

    //创建superView的子视图
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    view1.backgroundColor = [UIColor whiteColor];
    //将view1添加到superView上去显示，addSubview添加的子视图显示在最上面
    [superView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 50, 50)];
    view2.backgroundColor = [UIColor blackColor];
    //将View1添加到superView上去显示,addSubview添加的子视图显示在最上层(后来居上)
    [superView addSubview:view2];
    
    //子视图的插入（3种形式）
    //将view2作为superView的子视图，插入到索引为0的位置显示
    //    [superView insertSubview:view2 atIndex:0];
    
    //将view2作为superView的子视图，插入到view的上面显示
    //    [superView insertSubview:view2 aboveSubview:view1];
    
    //将view2作为superView的子视图，插入到view1的下面显示
    [superView insertSubview:view2 belowSubview:view1];
    
    //将子视图view2移动最上面显示
    [superView bringSubviewToFront:view2];
    
    //将子视图view2移动到最下面显示
    [superView sendSubviewToBack:view2];
    
    //将两个索引对应的视图调换显示位置
    [superView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    //把view2从父视图上移除
    if (view2.superview != nil) {   //判断view2是否有父视图
        [view2 removeFromSuperview];
    }

    //判断一个视图是否在界面上显示，只需要判断view2.superView是否为nil，
    //如果为nil，说明此视图在界面上没有显示

    //tag用于标记此视图，方便父视图查找
    view1.tag = 100;
    
    //透明度
    view1.alpha = 0.8;  //0--1

    //获取superView视图下面的所有子视图
    NSArray *subViews = superView.subviews;
    for (UIView *view in subViews) {
        view.backgroundColor = [UIColor grayColor];
    }

    //是否隐藏
    //    view1.hidden = YES;
    
    //开启多点触摸
    superView.multipleTouchEnabled = YES;

    //开启是否响应触摸事件
    superView.userInteractionEnabled = NO;  //默认为YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(200, 10, 100, 50);
    button.backgroundColor = [UIColor blueColor];
    [superView addSubview:button];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //父视图通过tag值查找对应的子视图
    UIView *view = [self.window viewWithTag:100];
    view.backgroundColor = [UIColor greenColor];

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
