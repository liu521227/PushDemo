//
//  ViewController.m
//  PushDemo
//
//  Created by 秦 on 16/8/19.
//  Copyright © 2016年 秦. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "PushViewController.h"
#import "NSObject+Tool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if ([app.userInfo[@"type"] isEqual:@"1"]) {
        PushViewController *vc = [[PushViewController alloc] init];
        [[self currentViewController].navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)btn:(id)sender {
    
    [self pushMessage];
}

//创建本地通知
- (void)pushMessage
{
    //5秒以后发送通知
    NSDate *timeDate=[[NSDate alloc] initWithTimeIntervalSinceNow:10];
    
    // 1.创建本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    
    // 2.设置本地通知的内容
    // 2.1.设置通知发出的时间
    localNote.fireDate = timeDate;
    // 2.2.设置通知的内容
    localNote.alertBody = @"push跳转";
    // 2.3.设置滑块的文字（锁屏状态下：滑动来“解锁”）
    localNote.alertAction = @"解锁";
    // 2.4.决定alertAction是否生效
    localNote.hasAction = NO;
    // 2.7.设置有通知时的音效
    localNote.soundName = @"buyao.wav";
    
    // 2.8.设置额外信息
    localNote.userInfo = @{@"type" : @"1"};
    // 3.调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
