//
//  smsGuardMessageViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardMessageViewController.h"
#import "MessageTableViewCell.h"
#import "smsGuardDetailMessagingViewController.h"
@interface smsGuardMessageViewController ()

@end

@implementation smsGuardMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
        self.title = @"Messages";
        
        messageTable  =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-(64+50))];
        messageTable.delegate = self;
        messageTable.dataSource = self;
        
        //init dummy
        
        
        [self.view addSubview:messageTable];
    }
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here to do what you want when you hit delete
        [tableView reloadData];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cells = @"cell";
    MessageTableViewCell *cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    if(!cell){
        cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    cell.message.text = @"Traveling back and forth through time, Cable recently traveled back to the future with a special purpose";
    [cell.message sizeToFit];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    smsGuardDetailMessagingViewController *detail =[[smsGuardDetailMessagingViewController alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
    
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
