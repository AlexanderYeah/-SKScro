//
//  SKInfiniteLoopView.h
//  SKScrowDemo
//
//  Created by Alexander on 2018/2/1.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKInfiniteLoopView : UICollectionView
/** 出入进来的图片数组 */
@property (nonatomic,strong)NSArray *imgArr;


- (instancetype)initWithImgArr:(NSArray *)imgArr;





@end
