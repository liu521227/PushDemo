//
//  NSObject+Tool.h
//  PPDLoanSDKDemon
//
//  Created by 秦 on 16/8/19.
//  Copyright © 2016年 ppdai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (Tool)

//通过控制器的布局视图可以获取到控制器实例对象    modal的展现方式需要取到控制器的根视图
- (UIViewController *)currentViewController;

@end
