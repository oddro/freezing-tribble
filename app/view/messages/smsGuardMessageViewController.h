//
//  smsGuardMessageViewController.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface smsGuardMessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *messageTable;
    NSMutableArray *dummy_data;
}
@end
