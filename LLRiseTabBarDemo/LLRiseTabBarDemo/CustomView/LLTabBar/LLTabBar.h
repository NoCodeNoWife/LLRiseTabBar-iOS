//
//  LLTabBar.h
//  LLRiseTabBarDemo
//
//  Created by Meilbn on 10/18/15.
//  Copyright © 2015 meilbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTabBarItem.h"

@protocol LLTabBarDelegate <NSObject>

- (void)tabBarDidSelectedRiseButton;

@end

@interface LLTabBar : UIView

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;
@property (nonatomic, weak) id <LLTabBarDelegate> delegate;

@end
