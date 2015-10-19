//
//  LLTabBarItem.m
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import "LLTabBarItem.h"

@interface LLTabBarItem () {
//	UIImageView *iconImageView;
}

@end

@implementation LLTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		self.clipsToBounds = NO;
//		self.imageView.contentMode = UIViewContentModeScaleAspectFit;
	}
	
	return self;
}

- (instancetype)init {
	self = [super init];
	
	if (self) {
		self.clipsToBounds = NO;
	}
	
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		self.clipsToBounds = NO;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect {
	
}

- (void)layoutSubviews {
	[self.titleLabel sizeToFit];
	CGSize titleSize = self.titleLabel.frame.size;

	CGPoint imageViewCenter = self.imageView.center;
	imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
	imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
	self.imageView.center = imageViewCenter;
	
//	if (!iconImageView) {
//		iconImageView = [[UIImageView alloc] initWithFrame:self.imageView.frame];
//		self.imageView.hidden = YES;
//	}
//	iconImageView.image = self.imageView.image;
//	iconImageView.center = imageViewCenter;
//	[self addSubview:iconImageView];
	
	CGPoint labelCenter = CGPointMake(imageViewCenter.x, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
	self.titleLabel.center = labelCenter;
	
//	NSLog(@"self.imageView.frame.size = %@", NSStringFromCGSize(self.imageView.frame.size));
//	NSLog(@"self.imageView.image.size = %@", NSStringFromCGSize(self.imageView.image.size));
	
	// 还有一种实现方式是设置 Edge Insets，不过还没试过，Xcode 7.0.1 好像有点不开心，在 IB 里面更改一下属性的时候，经常崩溃。。。
	[self setTitleEdgeInsets:UIEdgeInsetsMake(36, -5, 3, 18)];
	[self setImageEdgeInsets:UIEdgeInsetsMake(5, 18, 15, 18)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
