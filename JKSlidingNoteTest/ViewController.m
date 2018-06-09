//
//  ViewController.m
//  JKSlidingNoteTest
//
//  Created by JackYoung on 2018/6/7.
//  Copyright © 2018年 JackYoung. All rights reserved.
//

#import "ViewController.h"
#import "JKSlidingNoteView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    //----------------------------------------------------------------------------------------
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 88, 88)];
    label.text = @"公告新闻";
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont boldSystemFontOfSize:25];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    JKSlidingNoteView *slidingNote = [[JKSlidingNoteView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), label.frame.origin.y, [UIScreen mainScreen].bounds.size.width, label.frame.size.height) showingLinesCount:3 timerInterval:2 direction:JKSlidingNoteViewScrollDirectionGoUp titlesArray:@[@"1:Jack is a good boy",@"2:you r right",@"3:you r right..."]];
    [self.view addSubview:slidingNote];
    
    //----------------------------------------------------------------------------------------
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 88, 44)];
    label2.text = @"公告新闻";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.numberOfLines = 0;
    label2.font = [UIFont boldSystemFontOfSize:15];
    label2.textColor = [UIColor whiteColor];
    label2.backgroundColor = [UIColor redColor];
    [self.view addSubview:label2];
    
    JKSlidingNoteView *slidingNote2 = [[JKSlidingNoteView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label2.frame), label2.frame.origin.y, [UIScreen mainScreen].bounds.size.width, label2.frame.size.height) showingLinesCount:1 timerInterval:2 direction:JKSlidingNoteViewScrollDirectionGoUp titlesArray:@[@"1:Jack is a good boy",@"2:you r right",@"3:you r right..."]];
    [self.view addSubview:slidingNote2];
    
    //----------------------------------------------------------------------------------------
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 500, 88, 88)];
    label3.text = @"公告新闻";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.numberOfLines = 0;
    label3.font = [UIFont boldSystemFontOfSize:25];
    label3.textColor = [UIColor whiteColor];
    label3.backgroundColor = [UIColor redColor];
    [self.view addSubview:label3];
    
    JKSlidingNoteView *slidingNote3 = [[JKSlidingNoteView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label3.frame), label3.frame.origin.y, [UIScreen mainScreen].bounds.size.width, label3.frame.size.height) showingLinesCount:2 timerInterval:2 direction:JKSlidingNoteViewScrollDirectionGoDown titlesArray:@[@"1:Jack is a good boy",@"2:you r right",@"3:you r right..."]];
    [self.view addSubview:slidingNote3];
}


@end
