//
//  AppDelegate.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/21.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "AppDelegate.h"
#import "MineViewController.h"
#import "DiscoverViewController.h"
#import "SolidesFriendsViewController.h"
#import "SolidesViewController.h"
#import "SmallScripViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //UITableBarController
    self.tabBarVC = [[UITabBarController alloc] init];
    //创建被tabBarC管理的视图控制器
    //糗事
    UIStoryboard *solidStory = [UIStoryboard storyboardWithName:@"Solides" bundle:nil];
    UINavigationController *solidNav = solidStory.instantiateInitialViewController;
    solidNav.tabBarItem.image = [UIImage imageNamed:@"21-skul"];
    //设置tabBar选中图片模式，按照图片原始状态显示
    UIImage *solidSelectedImage = [UIImage imageNamed:@"21-skul"];
    solidNav.tabBarItem.selectedImage = [solidSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整tabBar图片显示的位置（顺序为：上，左，下，右）
    solidNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    
    //糗友圈
    UIStoryboard *solidFriendStory = [UIStoryboard storyboardWithName:@"SolidFriends" bundle:nil];
    UINavigationController *solidFriendNav = solidFriendStory.instantiateInitialViewController;
    solidFriendNav.tabBarItem.image = [UIImage imageNamed:@"34-coffee"];
    //设置tabBar选中图片模式，按照图片原始状态显示
    UIImage *solidFriendSelectedImage = [UIImage imageNamed:@"34-coffee"];
    solidFriendNav.tabBarItem.selectedImage = [solidFriendSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整tabBar图片显示的位置（顺序为：上，左，下，右）
    solidFriendNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    
    //发现
    UIStoryboard *discoverStory = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    UINavigationController *discoverNav = discoverStory.instantiateInitialViewController;
    discoverNav.tabBarItem.image = [UIImage imageNamed:@"12-eye"];
    //设置tabBar选中图片模式，按照图片原始状态显示
    UIImage *discoverSelectedImage = [UIImage imageNamed:@"12-eye"];
    discoverNav.tabBarItem.selectedImage = [discoverSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整tabBar图片显示的位置（顺序为：上，左，下，右）
    discoverNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //小纸条
    UIStoryboard *smallScripStory = [UIStoryboard storyboardWithName:@"SmallScrips" bundle:nil];
    UINavigationController *smallScripNav = smallScripStory.instantiateInitialViewController;
    smallScripNav.tabBarItem.image = [UIImage imageNamed:@"12-eye"];
    //设置tabBar选中图片模式，按照图片原始状态显示
    UIImage *smallScripSelectedImage = [UIImage imageNamed:@"12-eye"];
    smallScripNav.tabBarItem.selectedImage = [smallScripSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整tabBar图片显示的位置（顺序为：上，左，下，右）
    smallScripNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //我的
    UIStoryboard *mineStory = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
    UINavigationController *mineNav = mineStory.instantiateInitialViewController;
    mineNav.tabBarItem.image = [UIImage imageNamed:@"51-outlet"];
    //设置tabBar选中图片模式，按照图片原始状态显示
    UIImage *mineNavSelectedImage = [UIImage imageNamed:@"51-outlet"];
    mineNav.tabBarItem.selectedImage = [mineNavSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整tabBar图片显示的位置（顺序为：上，左，下，右）
    mineNav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    //添加被管理的视图
    self.tabBarVC.viewControllers = @[solidNav, solidFriendNav, discoverNav, smallScripNav, mineNav];
    //设置tabBar导航栏的颜色
    self.tabBarVC.tabBar.barTintColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = self.tabBarVC;

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

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
