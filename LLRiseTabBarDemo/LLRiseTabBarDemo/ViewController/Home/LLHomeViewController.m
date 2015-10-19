//
//  LLHomeViewController.m
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import "LLHomeViewController.h"
#import "LLTabBarItem.h"
#import "LLTabBar.h"

@interface LLHomeViewController () {
	UIButton *button;
	LLTabBarItem *testItem;
}

@end

@implementation LLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:CGRectMake(0, 230, SCREEN_WIDTH, 49)];
	
	CGFloat normalButtonWidth = (SCREEN_WIDTH * 3 / 4) / 4;
	CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
	CGFloat publishItemWidth = (SCREEN_WIDTH / 4);
	
	NSInteger startY = 300;
	
	LLTabBarItem *homeItem = [self tabBarItemWithFrame:CGRectMake(0, startY, normalButtonWidth, tabBarHeight)
												 title:@"首页"
									   normalImageName:@"home_normal"
									 selectedImageName:@"home_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *sameCityItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, startY, normalButtonWidth, tabBarHeight)
													 title:@"同城"
										   normalImageName:@"mycity_normal"
										 selectedImageName:@"mycity_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *publishItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, startY, publishItemWidth, tabBarHeight)
													title:@"发布"
										  normalImageName:@"post_normal"
										selectedImageName:@"post_normal" tabBarItemType:LLTabBarItemTypeRise];
	LLTabBarItem *messageItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, startY, normalButtonWidth, tabBarHeight)
													title:@"消息"
										  normalImageName:@"message_normal"
										selectedImageName:@"message_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *mineItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 3 + publishItemWidth, startY, normalButtonWidth, tabBarHeight)
												 title:@"我的"
									   normalImageName:@"account_normal"
									 selectedImageName:@"account_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	
	[self.view addSubview:homeItem];
	[self.view addSubview:sameCityItem];
	[self.view addSubview:publishItem];
	[self.view addSubview:messageItem];
	[self.view addSubview:mineItem];
	
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"首页" forState:UIControlStateNormal];
	[button setTitle:@"首页" forState:UIControlStateSelected];
	button.titleLabel.font = [UIFont systemFontOfSize:8];
	UIImage *normalImage = [UIImage imageNamed:@"home_normal"];
	UIImage *selectedImage = [UIImage imageNamed:@"home_highlight"];
	[button setImage:normalImage forState:UIControlStateNormal];
	[button setImage:selectedImage forState:UIControlStateSelected];
	[button setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
	[button setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
	button.frame = CGRectMake(0, CGRectGetMaxY(mineItem.frame) + 100, normalButtonWidth, tabBarHeight);
	[self.view addSubview:button];
	
	testItem = [self tabBarItemWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame) - 80, normalButtonWidth, tabBarHeight)
								   title:@"首页"
						 normalImageName:@"home_normal"
					   selectedImageName:@"home_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	[self.view addSubview:testItem];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	[button.titleLabel sizeToFit];
	CGSize titleSize = button.titleLabel.frame.size;
	
	CGPoint imageViewCenter = button.imageView.center;
	imageViewCenter.x = CGRectGetWidth(button.frame) / 2;
	imageViewCenter.y = (CGRectGetHeight(button.frame) - titleSize.height) / 2;
	button.imageView.center = imageViewCenter;
	CGPoint labelCenter = CGPointMake(imageViewCenter.x, CGRectGetHeight(button.frame) - 3 - titleSize.height / 2);
	button.titleLabel.center = labelCenter;
	
	[testItem layoutSubviews];
}

- (LLTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(LLTabBarItemType)tabBarItemType {
	LLTabBarItem *item = [[LLTabBarItem alloc] init];
	item.frame = frame;
	[item setTitle:title forState:UIControlStateNormal];
	[item setTitle:title forState:UIControlStateSelected];
	item.titleLabel.font = [UIFont systemFontOfSize:8];
	UIImage *normalImage = [UIImage imageNamed:normalImageName];
	UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
	[item setImage:normalImage forState:UIControlStateNormal];
	[item setImage:selectedImage forState:UIControlStateSelected];
	[item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
	[item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
	item.tabBarItemType = tabBarItemType;
	
	return item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
