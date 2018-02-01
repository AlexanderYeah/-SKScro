# 无限循环的轮播器
1. 无限循环 
2. 左右拖动

## 实现方案
1. 自定义UICollectionView 
2. 自定义UICollectionFlowLayout 布局
3. 自定义UICollectionCell 


## Tips

1. 自定义UICollectionFlowLayout 的时候 一定要先调用父类的此方法,在此方法中，collectionView 的frame 已经设置好了
```
	[super prepareLayout];  
```

2. 左右滑动的实现技巧就是 数据源乘以相应的倍数 比如有3张图片 
则数据源设置为6张。程序一旦启动，就将其定位到第4 张图片，向左滑动就是第一张，当滑动到最后一张的时候，将其定位到第一张图片。

3. 多线程的使用
```
		
		// 为了实现向左滑动 程序一进来就让其定位到第二组图片的第一个
		// 主队列调度任务
		// 安排任务在主线程执行，当前主线程有任务，暂不执行，等待主线程调度完成在去执行
		// 如果不使用主线程的话，代码会先进入到init 方法，此时数据源还没有实现，要滚动的索引是根据数据源数据而来的，所以下面代码必须要在数据源实现之后进行执行 
		dispatch_async(dispatch_get_main_queue(), ^{
			NSIndexPath *path = [NSIndexPath indexPathForItem:self.imgArr.count inSection:0];
			
			[self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
		});  
```

4  滑动太快的时候可能有卡动的情况，数据源乘以100倍来进行优化