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
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:fontDefault size:10.0f],
                                                       NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:0.482 blue:0.227 alpha:1]
                                                       } forState:UIControlStateNormal];
    
    
    // doing this results in an easier to read unselected state then the default iOS 7 one
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:fontDefault size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateSelected];
    [tabBarController setViewControllers:@[nav1,nav2,nav3,nav4] animated:YES];
    
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-on-01"] imageWithRenderingMode:UIImageRenderingModeAutomatic ];
    tabBarItem1.image = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-off-01"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-on-02"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem2.image = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-off-02"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-on-03"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem3.image = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-off-03"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabBarItem3.title = @"xxxx";
    
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-on-04"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    tabBarItem4.image = [[UIImage imageNamed:@"smsguard-iphone-footer-icon-off-04"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
//    tabBarItem4.title = @"xxxx";
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [self prompt_login_show];
    return YES;
}
-(void)signinToServer{
    
}
-(void)prompt_login_show{
    UINavigationController *nav4 =[[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(@"enervoLoginViewController") alloc]init]];
    [self.window.rootViewController presentViewController:nav4 animated:YES completion:^{
        
    }];
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
    [self prompt_login_show];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
