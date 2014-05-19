//
//  smsGuardContactsViewController.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface smsGuardContactsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>
{
    UITableView *contact;
    NSArray *contacts_name_IndexTitles;
    NSDictionary *contacts_name;
    NSArray *contacts_name_section;
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
    NSArray *searchData;
    NSMutableArray *data_contact;
}
@end
