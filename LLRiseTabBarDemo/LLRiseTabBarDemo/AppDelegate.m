//
//  AppDelegate.m
//  LLRiseTabBarDemo
//
//  Created by HelloWorld on 10/18/15.
//  Copyright © 2015 melody. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBar.h"
#import "LLTabBarItem.h"
#import "LLHomeViewController.h"
#import "LLSameCityViewController.h"
#import "LLMessageViewController.h"
#import "LLMineViewController.h"

@interface AppDelegate () <LLTabBarDelegate, UIActionSheetDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	LLHomeViewController *homeViewController = [[LLHomeViewController alloc] init];
	LLSameCityViewController *sameCityViewController = [[LLSameCityViewController alloc] init];
	LLMessageViewController *messageViewController = [[LLMessageViewController alloc] init];
	LLMineViewController *mineViewController = [[LLMineViewController alloc] init];
	
	UITabBarController *tabbarController = [[UITabBarController alloc] init];
	tabbarController.viewControllers = @[homeViewController, sameCityViewController, messageViewController, mineViewController];
	
	[[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
	[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
	
	LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:tabbarController.tabBar.bounds];
	
	CGFloat normalButtonWidth = (SCREEN_WIDTH * 3 / 4) / 4;
	CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
	CGFloat publishItemWidth = (SCREEN_WIDTH / 4);
	
	LLTabBarItem *homeItem = [self tabBarItemWithFrame:CGRectMake(0, 0, normalButtonWidth, tabBarHeight)
												 title:@"首页"
									   normalImageName:@"home_normal"
									 selectedImageName:@"home_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *sameCityItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight)
													 title:@"同城"
										   normalImageName:@"mycity_normal"
										 selectedImageName:@"mycity_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *publishItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, 0, publishItemWidth, tabBarHeight)
													title:@"发布"
										  normalImageName:@"post_normal"
										selectedImageName:@"post_normal" tabBarItemType:LLTabBarItemTypeRise];
	LLTabBarItem *messageItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
													title:@"消息"
										  normalImageName:@"message_normal"
										selectedImageName:@"message_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	LLTabBarItem *mineItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 3 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
												 title:@"我的"
									   normalImageName:@"account_normal"
									 selectedImageName:@"account_highlight" tabBarItemType:LLTabBarItemTypeNormal];
	
	tabBar.tabBarItems = @[homeItem, sameCityItem, publishItem, messageItem, mineItem];
	tabBar.delegate = self;
	
	[tabbarController.tabBar addSubview:tabBar];
	
	self.window.rootViewController = tabbarController;
	
	return YES;
}

- (LLTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(LLTabBarItemType)tabBarItemType {
	LLTabBarItem *item = [[LLTabBarItem alloc] initWithFrame:frame];
	[item setTitle:title forState:UIControlStateNormal];
	[item setTitle:title forState:UIControlStateSelected];
	item.titleLabel.font = [UIFont systemFontOfSize:8];
	UIImage *normalImage = [UIImage imageNamed:normalImageName];
	UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
	[item setImage:normalImage forState:UIControlStateNormal];
	[item setImage:selectedImage forState:UIControlStateSelected];
	[item setImage:selectedImage forState:UIControlStateHighlighted];
	[item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
	[item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
	item.tabBarItemType = tabBarItemType;
	
	return item;
}

#pragma mark - LLTabBarDelegate

- (void)tabBarDidSelectedRiseButton {
	UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
	UIViewController *viewController = tabBarController.selectedViewController;
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
															 delegate:self
													cancelButtonTitle:@"取消"
											   destructiveButtonTitle:nil
													otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
	[actionSheet showInView:viewController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"buttonIndex = %ld", buttonIndex);
}

#pragma mark -

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
