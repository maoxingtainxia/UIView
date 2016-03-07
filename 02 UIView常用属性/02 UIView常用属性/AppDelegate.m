//
//  AppDelegate.m
//  02 UIView常用属性
//
//  Created by Rodolfo on 16/1/6.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
   
    //添加一个BOOL值，用于按钮响应事件中视图的隐藏
    //全局BOOL类型的值默认是 NO
    BOOL b;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //此处的点语法，与之前的get方法相对应
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*-----------------------Frame与Bounds---------------------*/
    /*
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view1.backgroundColor = [UIColor redColor];
    [self.window addSubview:view1];
    
    //打印视图的中心坐标
    NSLog(@"view1.center is %@",NSStringFromCGPoint(view1.center));
    //以父视图为坐标系，打印frame
    NSLog(@"view1.frame is %@",NSStringFromCGRect(view1.frame));
    //以自身视图为坐标系，打印bounds
    NSLog(@"view1.bounds is %@",NSStringFromCGRect(view1.bounds));
    
    //更改frame
    view1.frame = CGRectMake(50, 50, 100, 100);
    
    //origin是x和y的值，size是width和height的值
    //基于父视图的x和y坐标不能直接进行某值的直接修改
    //    view1.frame.origin.x += 20;
    
    //改变坐标方法
    CGRect rect = view1.frame;
    rect.origin.x += 100;
    view1.frame = rect;
    */
    
    /*--------------------View的层次结构------------------------*/
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    //为视图添加tag值
    view1.tag = 2014;
    view1.backgroundColor = [UIColor redColor];
    [self.window addSubview:view1];
    
    //创建View2，添加到view1上
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    view2.tag = 2015;
    view2.backgroundColor = [UIColor greenColor];
    //添加子视图
    [view1 addSubview:view2];
    
    //创建view3，添加到view1上
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, 20, 100, 100)];
    view3.tag = 2016;
    view3.backgroundColor = [UIColor blueColor];    //blue film 黄片
    //后加进来的视图会遮住前面的视图
    [view1 addSubview:view3];
    NSLog(@"view2.frame = %@",NSStringFromCGRect(view2.frame));
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(80, 20, 100, 100)];
    view4.tag = 2017;
    view4.backgroundColor = [UIColor cyanColor];    //青色
    [view1 addSubview:view4];
    
    //透明度：0-->1
    //    view3.alpha = 0.5;
    
//    //将视图添加到另一个视图的上面
//    [view1 insertSubview:view3 aboveSubview:view4];
//    //将视图添加到另一个视图的下面
//    [view1 insertSubview:view3 belowSubview:view4];
//    //插入到下标为1的位置,更改了视图在父视图中的存储位置（数组中的存储顺序）
//    [view1 insertSubview:view4 atIndex:1];
//    
//    //打印父视图中的所有子视图，查看一下在数组中存储位置的变化
//    NSArray *arr = view1.subviews;
//    NSLog(@"arr = %@",arr);
    
    //添加一个button(创建、添加事件、添加到父视图上)
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 350, 40, 40);
    btn.backgroundColor = [UIColor blueColor];
    
    //为button添加点击事件
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:btn];
    
    return YES;
}

//按钮点击响应的方法
- (void)action {
   
    //如何在其他方法中访问视图对象？
    //viewWithTag: 在父视图中通过tag值获取子视图
    UIView *subView1 = [self.window viewWithTag:2014];
    //    NSLog(@"view1.frame = %@",NSStringFromCGRect(subView1.frame));
    //    
    //    UIView *subView2 = [subView1 viewWithTag:2015]; //绿的
    //
    //    UIView *subView3 = [subView1 viewWithTag:2016]; //蓝的
    
    //通过下标交换两个视图的位置
    //    [subView1 exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
    
    //把视图移到最上面
    //    [subView1 bringSubviewToFront:subView2];
    
    //把视图移动最下面
    //    [subView1 sendSubviewToBack:subView3];
    
    //从父视图上移除子视图
    //    [subView2 removeFromSuperview];
    
    //安全移除方法，首先判断父视图是否存在
    //    if (subView2.superview != nil) {
    //        //从父视图删除
    //        [subView2 removeFromSuperview];
    //    }
    
    //让view1隐藏
    subView1.hidden = !b;
    b = !b;
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
