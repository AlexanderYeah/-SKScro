//
//  SKLoopCollectionViewCell.m
//  SKScrowDemo
//
//  Created by Alexander on 2018/2/1.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKLoopCollectionViewCell.h"

@interface SKLoopCollectionViewCell()



@end

@implementation SKLoopCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		// 添加一个图片
		self.faceImgView = [[UIImageView alloc]initWithFrame:self.bounds];
		self.faceImgView.backgroundColor = [UIColor redColor];
		
		[self.contentView addSubview:self.faceImgView];
	}
	return self;
}





@end
