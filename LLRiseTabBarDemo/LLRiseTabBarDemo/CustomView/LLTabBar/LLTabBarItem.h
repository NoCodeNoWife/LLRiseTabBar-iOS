//
//  LLTabBarItem.h
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LLTabBarItemType) {
	LLTabBarItemTypeNormal = 0,
	LLTabBarItemTypeRise,
};

@interface LLTabBarItem : UIButton

@property (nonatomic, assign) LLTabBarItemType tabBarItemType;

@end
