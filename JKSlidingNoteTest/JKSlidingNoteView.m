//
//  JKSlidingNoteView.m
//  JKSlidingNoteTest
//
//  Created by JackYoung on 2018/6/7.
//  Copyright © 2018年 JackYoung. All rights reserved.
//

#import "JKSlidingNoteView.h"

@interface JKSlidingNoteView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)CGFloat cellHeight;
@property (nonatomic, assign)CGFloat timerInterval;
@property (nonatomic, strong)NSArray *titlesArray;
@property (nonatomic, assign)NSInteger showingLinesCount;
@property (nonatomic, assign)JKSlidingNoteViewScrollDirection direction;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)NSInteger currentIndex;

@end

@implementation JKSlidingNoteView

-(instancetype)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		_tableView.backgroundColor = [UIColor redColor];
		_tableView.showsHorizontalScrollIndicator = NO;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_tableView.userInteractionEnabled = false;
		_tableView.delegate = self;
		_tableView.dataSource = self;
		[self addSubview:_tableView];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame showingLinesCount:(NSInteger)showingLinesCount timerInterval:(CGFloat)timerInterval direction:(JKSlidingNoteViewScrollDirection)scrollDirection titlesArray:(NSArray *)titlesArray{
	if (self = [self initWithFrame:frame]) {
		[self setData:showingLinesCount timerInterval:timerInterval direction:scrollDirection titlesArray:titlesArray];
	}
	return self;
}

-(void)setData: (NSInteger)showingLinesCount timerInterval:(CGFloat)timerInterval direction:(JKSlidingNoteViewScrollDirection)scrollDirection titlesArray:(NSArray *)titlesArray{
	_direction = scrollDirection;
	_timerInterval = timerInterval;
	_showingLinesCount = showingLinesCount;
	_titlesArray = titlesArray;
	_cellHeight = self.frame.size.height / (_showingLinesCount * 1.0);
	[_tableView reloadData];
	
	if(_timer != nil){
		[_timer invalidate];
	}
	
	_timer = [NSTimer timerWithTimeInterval:_timerInterval target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
	
	[[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)timerFire {
	__block JKSlidingNoteView *weakSelf = self;
	if (weakSelf.direction == JKSlidingNoteViewScrollDirectionGoUp) {
		weakSelf.currentIndex = weakSelf.currentIndex + 1;
		if (weakSelf.currentIndex >= weakSelf.titlesArray.count * 3 - (weakSelf.showingLinesCount - 1)) {
			//NSLog(@"++++++++%ld",weakSelf.currentIndex);
			weakSelf.currentIndex = weakSelf.titlesArray.count * 2 - weakSelf.showingLinesCount;
			[weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
			weakSelf.currentIndex = weakSelf.currentIndex + 1;
		}
	} else if (weakSelf.direction == JKSlidingNoteViewScrollDirectionGoDown) {
		weakSelf.currentIndex = weakSelf.currentIndex - 1;
		if (weakSelf.currentIndex < 0) {
			//NSLog(@"++++++++%ld",weakSelf.currentIndex);
			weakSelf.currentIndex = weakSelf.titlesArray.count;
			[weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
			weakSelf.currentIndex = weakSelf.currentIndex - 1;
		}
	}
	[weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
	//NSLog(@"____________%ld",weakSelf.currentIndex);
}

#pragma mark ---------- UITableViewDelegate,UITableViewDataSource ------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(_titlesArray != nil){
		return _titlesArray.count * 3;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKSlidingNoteView"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JKSlidingNoteView"];
    }
    cell.textLabel.text = _titlesArray[indexPath.row % (_titlesArray.count)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%ld",indexPath.row % _titlesArray.count);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y <= 0) {
        [scrollView setContentOffset:CGPointMake(0, _titlesArray.count * _cellHeight)];
    } else if (scrollView.contentOffset.y > (_titlesArray.count * 3 - _showingLinesCount) * _cellHeight) {
        [scrollView setContentOffset:CGPointMake(0, (_titlesArray.count * 2 - _showingLinesCount) * _cellHeight)];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _currentIndex = (int)scrollView.contentOffset.y / _cellHeight;
    [_timer setFireDate:[NSDate distantPast]];
}
@end
