//
//  enervoAppDelegate.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enervoAppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    NSArray *controller;
    UITabBarController *tabBarController;
}
@property (strong, nonatomic) UIWindow *window;
-(void)prompt_login_show;
-(void)signinToServer;

@end
