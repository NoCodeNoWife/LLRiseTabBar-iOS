//
//  LLTabBarItem.m
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import "LLTabBarItem.h"

@implementation LLTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		[self config];
	}
	
	return self;
}

- (instancetype)init {
	self = [super init];
	
	if (self) {
		[self config];
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		[self config];
	}
	
	return self;
}

- (void)config {
	self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self.titleLabel sizeToFit];
	CGSize titleSize = self.titleLabel.frame.size;

	CGSize imageSize = [self imageForState:UIControlStateNormal].size;
	NSLog(@"itemImage.size = %@", NSStringFromCGSize(self.imageView.image.size));
	if (imageSize.width != 0 && imageSize.height != 0) {
		CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2;
		self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
	} else {
		CGPoint imageViewCenter = self.imageView.center;
		imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
		imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
		self.imageView.center = imageViewCenter;
	}
	
	CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
	self.titleLabel.center = labelCenter;
	
	// 还有一种实现方式是设置 Edge Insets，Xcode 7.0.1 好像有点不开心，在 IB 里面更改一下属性的时候，经常崩溃。。。
	/*
	 
	 [self.titleLabel sizeToFit];
	 CGSize titleSize = self.titleLabel.frame.size;
	 NSInteger titleTopInset = CGRectGetHeight(self.frame) - 3 - titleSize.height;
	 [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopInset, -5, 3, 18)];
	 [self setImageEdgeInsets:UIEdgeInsetsMake(5, 18, 15, 18)];
	 
	 */
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
