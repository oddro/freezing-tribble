//
//  smsGuardSettingViewController.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionSheetPicker.h"

@class AbstractActionSheetPicker;
@interface smsGuardSettingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table_setting;
    NSArray *menu_set;
    UIAlertView *prompt_edit;
    NSMutableArray *data;
    int index;
    NSString *content;
}
@property (nonatomic, strong) AbstractActionSheetPicker *actionSheetPicker;
@end
