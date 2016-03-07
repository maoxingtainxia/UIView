//
//  AppDelegate.h
//  01 UIWindow的使用
//
//  Created by Rodolfo on 16/1/6.
//  Copyright (c) 2016年 贝沃汇力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
   
    //若要叠加窗口，需将创建的窗口设置为全局变量，或将程序设置为MRC模式
    UIWindow *_win;
}

@property (strong, nonatomic) UIWindow *window;


@end

