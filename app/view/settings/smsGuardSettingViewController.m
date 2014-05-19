//
//  smsGuardSettingViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardSettingViewController.h"

@interface smsGuardSettingViewController ()

@end

@implementation smsGuardSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"Setting";
        table_setting = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        table_setting.delegate = self;
        table_setting.dataSource = self;
        [self.view addSubview:table_setting];
    }
    return self;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:
(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  tableView.bounds.size.width, 26)];
    headerView.backgroundColor= [UIColor colorWithRed:0 green:0.482 blue:0.227 alpha:1];
    NSString *dateStr = @"Account Information";
    CGFloat labelWidth = tableView.bounds.size.width / 2;
    CGFloat padding = 5.0;
    
    UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectMake
                         (padding, 0, (labelWidth - padding), 22)];
    labelOne.backgroundColor = [UIColor clearColor];
    labelOne.textColor = [UIColor whiteColor];
    labelOne.font = [UIFont fontWithName:fontDefault size:12];
    labelOne.text = dateStr;
    
    [headerView addSubview:labelOne];

    
    return headerView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *cells = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cells];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    cell.textLabel.text = @"Data";
    cell.detailTextLabel.text = @"Some Data";

    return cell;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
