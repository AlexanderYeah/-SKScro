//
//  ViewController.m
//  SKScrowDemo
//
//  Created by Alexander on 2018/2/1.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"
#import "SKInfiniteLoopView.h"
@interface ViewController ()


/** 图片数组 */
@property (nonatomic,strong)NSMutableArray *imgArr;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// 装载数据
	_imgArr = [NSMutableArray array];
	for (int i = 0 ; i < 3; i ++) {
		// 获取图片的地址
		NSURL *pathUrl = [[NSBundle mainBundle]URLForResource:[NSString stringWithFormat:@"%d.jpg",i] withExtension:nil];
		[_imgArr addObject:pathUrl];
	}
	
	
	[self showInfiniteScrollView];


}

/** 无限轮播ScrollView 的实现 */
- (void)showInfiniteScrollView
{
	
	SKInfiniteLoopView *loopView = [[SKInfiniteLoopView alloc]initWithImgArr:(NSArray *)self.imgArr];

	loopView.frame = CGRectMake(0, 200, self.view.frame.size.width, 200);
	[self.view addSubview:loopView];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
