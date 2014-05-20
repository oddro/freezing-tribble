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
        prompt_edit = [[UIAlertView alloc]init];
        prompt_edit.delegate = self;
        prompt_edit.alertViewStyle = UIAlertViewStylePlainTextInput;
        
        menu_set = @[@"Sms Center",@"Registration Center",@"Valid Until",@"Service Type",@"Version", @"Autolock",@"Language Selection",@"About"];
        data = [NSMutableArray arrayWithArray:menu_set];
        
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
    return menu_set.count;
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
    cell.textLabel.text = [menu_set objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:fontDefault size:17];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    
    cell.detailTextLabel.font =[UIFont fontWithName:fontDefault size:14];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    cell.detailTextLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row!=2&&indexPath.row!=3&&indexPath.row!=4&&indexPath.row!=7){
        index = indexPath.row;
        [prompt_edit addButtonWithTitle:@"Cancel"];
        [prompt_edit addButtonWithTitle:@"Change"];
        [prompt_edit setCancelButtonIndex:0];
        [prompt_edit setTitle:[NSString stringWithFormat:@"Change %@",[menu_set objectAtIndex:indexPath.row]]];
        
        [prompt_edit show];
        
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == [alertView cancelButtonIndex]) {
        NSLog(@"The cancel button was clicked for alertView");
        
    }
    else{
        [data replaceObjectAtIndex:index withObject:[prompt_edit textFieldAtIndex:0].text];
        [table_setting reloadData];
        
        
    }
    // else do your stuff for the rest of the buttons (firstOtherButtonIndex, secondOtherButtonIndex, etc)
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
