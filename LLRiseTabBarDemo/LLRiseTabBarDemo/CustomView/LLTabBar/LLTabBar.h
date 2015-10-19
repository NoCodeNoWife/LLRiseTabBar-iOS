//
//  LLTabBar.h
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LLTabBarDelegate;

@interface LLTabBar : UIView

@property (nonatomic, copy) NSArray *tabBarItems;
@property (nonatomic, weak) id <LLTabBarDelegate> delegate;

@end


@protocol LLTabBarDelegate <NSObject>

- (void)tabBar:(LLTabBar *)tabBar didSelectAtIndex:(NSInteger *)index;

@end