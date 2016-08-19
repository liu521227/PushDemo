//
//  UIView+Tool.m
//  PPDLoanSDKDemon
//
//  Created by 秦 on 16/8/19.
//  Copyright © 2016年 ppdai. All rights reserved.
//

#import "UIView+Tool.h"

@implementation UIView (Tool)

//通过响应者链条获取view所在的控制器
- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end
