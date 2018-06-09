# JKSlidingNoteTest
滚动公告，滚动广告，滚动新闻，支持上下两个方向，支持手指滑动，支持同时显示多行,支持自定义cell,调用很简单

调用：
```c
JKSlidingNoteView *slidingNote2 = [[JKSlidingNoteView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label2.frame), label2.frame.origin.y, [UIScreen mainScreen].bounds.size.width, label2.frame.size.height) showingLinesCount:1 timerInterval:2 direction:JKSlidingNoteViewScrollDirectionGoUp titlesArray:@[@"1:Jack is a good boy",@"2:you r right",@"3:you r right..."]];
```
```c
[self.view addSubview:slidingNote2];
```

![](https://raw.githubusercontent.com/JackYoung1989/JKSlidingNoteTest/master/ScreenShot.png)
