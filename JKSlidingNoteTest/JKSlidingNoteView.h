//
//  JKSlidingNoteView.h
//  JKSlidingNoteTest
//
//  Created by JackYoung on 2018/6/7.
//  Copyright © 2018年 JackYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JKSlidingNoteViewScrollDirection) {
    JKSlidingNoteViewScrollDirectionGoUp = 0,
    JKSlidingNoteViewScrollDirectionGoDown
};

@interface JKSlidingNoteView : UIView

@property (nonatomic, assign)JKSlidingNoteViewScrollDirection direction;
- (instancetype)initWithFrame:(CGRect)frame showingLinesCount:(NSInteger)showingLinesCount timerInterval:(CGFloat)timerInterval direction:(JKSlidingNoteViewScrollDirection)scrollDirection titlesArray:(NSArray *)titlesArray;
@end
