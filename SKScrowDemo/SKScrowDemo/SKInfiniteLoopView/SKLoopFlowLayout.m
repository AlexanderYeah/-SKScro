//
//  SKLoopFlowLayout.m
//  SKScrowDemo
//
//  Created by Alexander on 2018/2/1.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKLoopFlowLayout.h"

@implementation SKLoopFlowLayout

// collectview 第一次布局的时候 frame 已经设置完毕
- (void)prepareLayout
{
	// 要先实现super layout
	[super prepareLayout];
	
	// 设置对应的布局属性
	self.itemSize = self.collectionView.bounds.size;
	self.minimumLineSpacing = 0;
	self.minimumInteritemSpacing = 0;
	self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	
	self.collectionView.bounces = NO;
	self.collectionView.pagingEnabled = YES;
	self.collectionView.showsVerticalScrollIndicator = NO;
	self.collectionView.showsHorizontalScrollIndicator = NO;
	
	
}

@end
