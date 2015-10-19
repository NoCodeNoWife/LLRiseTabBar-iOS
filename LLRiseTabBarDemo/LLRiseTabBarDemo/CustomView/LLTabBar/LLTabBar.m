//
//  LLTabBar.m
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import "LLTabBar.h"

@implementation LLTabBar

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self) {
		[self config];
	}
	
	return self;
}

#pragma mark - Private Method

- (void)config {
	self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setter

- (void)setTabBarItems:(NSArray *)tabBarItems {
	for (id item in tabBarItems) {
		if ([item isKindOfClass:[UIView class]]) {
			[self addSubview:item];
		}
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
