//
//  enervoAppDelegate.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "enervoAppDelegate.h"

@implementation enervoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    ///do some dirty work
    tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    //init nav
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200.f, 0) forBarMetrics:UIBarMetricsDefault];
	[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
	
	NSShadow *shadow = [[NSShadow alloc] init];
    
	shadow.shadowColor = [UIColor clearColor];
    
	shadow.shadowOffset = CGSizeMake(0, 1);
    
	[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:fontDefault size:18], NSFontAttributeName, nil]];
    
    UINavigationController *nav1 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(@"smsGuardMessageViewController") alloc]init]];
    UINavigationController *nav2 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(@"smsGuardContactsViewController") alloc]init]];
    UINavigationController *nav3 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(@"smsGuardActivationViewController") alloc]init]];
    UINavigationController *nav4 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(@"smsGuardSettingViewController") alloc]init]];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar"]];
    [[UITabBar appearance]setTintColor:[UIColor whiteColor]];
    
    [tabBarController setViewControllers:@[nav1,nav2,nav3,nav4] animated:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
