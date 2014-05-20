//
//  enervoLoginViewController.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/20/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enervoLoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *password;
    UIButton *sign_in;
    UIButton *forget_password;
}
@end
