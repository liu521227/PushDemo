//
//  UIView+Tool.h
//  PPDLoanSDKDemon
//
//  Created by 秦 on 16/8/19.
//  Copyright © 2016年 ppdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tool)

//通过响应者链条获取view所在的控制器
- (UIViewController *)parentController;

@end
