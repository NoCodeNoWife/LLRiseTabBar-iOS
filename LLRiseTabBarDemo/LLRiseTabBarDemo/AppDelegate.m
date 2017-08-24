//
//  AppDelegate.m
//  LLRiseTabBarDemo
//
//  Created by Meilbn on 10/18/15.
//  Copyright © 2015 meilbn. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBar.h"
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
	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = @[homeViewController, sameCityViewController, messageViewController, mineViewController];
	
	[[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
	[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
	
	LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    
    tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"同城", kLLTabBarItemAttributeNormalImageName : @"mycity_normal", kLLTabBarItemAttributeSelectedImageName : @"mycity_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"发布", kLLTabBarItemAttributeNormalImageName : @"post_normal", kLLTabBarItemAttributeSelectedImageName : @"post_normal", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
                                    @{kLLTabBarItemAttributeTitle : @"消息", kLLTabBarItemAttributeNormalImageName : @"message_normal", kLLTabBarItemAttributeSelectedImageName : @"message_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"我的", kLLTabBarItemAttributeNormalImageName : @"account_normal", kLLTabBarItemAttributeSelectedImageName : @"account_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
    
//    tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
//                                    @{kLLTabBarItemAttributeTitle : @"发布", kLLTabBarItemAttributeNormalImageName : @"post_normal", kLLTabBarItemAttributeSelectedImageName : @"post_normal", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
//                                    @{kLLTabBarItemAttributeTitle : @"消息", kLLTabBarItemAttributeNormalImageName : @"message_normal", kLLTabBarItemAttributeSelectedImageName : @"message_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
    
//    tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
//                                    @{kLLTabBarItemAttributeTitle : @"同城", kLLTabBarItemAttributeNormalImageName : @"mycity_normal", kLLTabBarItemAttributeSelectedImageName : @"mycity_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
    
	tabBar.delegate = self;
	[tabBarController.tabBar addSubview:tabBar];
	
	self.window.rootViewController = tabBarController;
	
	return YES;
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
