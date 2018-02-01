//
//  SKInfiniteLoopView.m
//  SKScrowDemo
//
//  Created by Alexander on 2018/2/1.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKInfiniteLoopView.h"
#import "SKLoopFlowLayout.h"
#import "SKLoopCollectionViewCell.h"
NSString *const cellID = @"cellID";
@interface SKInfiniteLoopView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end


@implementation SKInfiniteLoopView


//- (void)drawRect:(CGRect)rect {
//    //Drawing code
//
//}



- (instancetype)initWithImgArr:(NSArray *)imgArr
{
	// 初始化 使用自定义的flowlayout布局
	self = [super initWithFrame:CGRectZero collectionViewLayout:[[SKLoopFlowLayout alloc]init]];
	
	if (self) {
		_imgArr = imgArr;			
		self.dataSource = self;
		self.delegate = self;
		// 注册cell
		[self registerClass:[SKLoopCollectionViewCell class] forCellWithReuseIdentifier:cellID];
		
		// 为了实现向左滑动 程序一进来就让其定位到第二组图片的第一个
		// 主队列调度任务
		// 安排任务在主线程执行，当前主线程有任务，暂不执行，等待主线程调度完成在去执行
		// 如果不使用主线程的话，代码会先进入到init 方法，此时数据源还没有实现，要滚动的索引是根据数据源数据而来的，所以下面代码必须要在数据源实现之后进行执行 
		dispatch_async(dispatch_get_main_queue(), ^{
			NSIndexPath *path = [NSIndexPath indexPathForItem:self.imgArr.count inSection:0];
			
			[self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
		});
		
	}
	return  self;
}

#pragma mark -  实现代理方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

	return self.imgArr.count * 100;
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	SKLoopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
	
	cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0f green:arc4random_uniform(256)/255.0f blue:arc4random_uniform(256)/255.0f alpha:1.0f];
	
	// 设置图片
	
	NSData *data = [[NSData alloc]initWithContentsOfURL:self.imgArr[indexPath.item % self.imgArr.count]];
	
	UIImage *img = [UIImage imageWithData:data];
	
	cell.faceImgView.image = img;
	
	
	return cell;

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	
	// 当图片滑到第一页或者最后一页的时候 重新定位图片
	CGFloat offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
	// 当前是最后一页 或者 第一页 让其重新定位
	if (offset == 0  || offset == [self numberOfItemsInSection:0] - 1) {
		if (offset == 0) {
			// 定位到最后一张
			offset = self.imgArr.count;
		}else{
			offset = self.imgArr.count - 1;
		}
	}
	
	// 重新调整
	scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
	

}



@end
