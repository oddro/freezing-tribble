//
//  smsGuardSendContactViewcontroller.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/22/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface smsGuardSendContactViewcontroller : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField *phone_numb;
    UITextField *seach_contact;
    UITableView *autoCompleteTableView;
    NSMutableArray *elementArray,*autoCompleteArray;
    UIButton *select_contact;
    UIButton *send_contact;
    
    
}
@end
