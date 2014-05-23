//
//  smsGuardActivationViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardActivationViewController.h"

@interface smsGuardActivationViewController ()

@end

@implementation smsGuardActivationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"Activation";
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"avtivate"]];
        
        activateCode = [[UITextField alloc]initWithFrame:CGRectMake(30, 50, 236,35)];
        activateCode.backgroundColor = [UIColor clearColor];
        activateCode.returnKeyType  = UIReturnKeyGo;
        activateCode.delegate = self;
        activateCode.font = [UIFont fontWithName:fontDefault size:14];
        
        activateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        activateButton.backgroundColor =[UIColor clearColor];
        activateButton.frame=CGRectMake(30, 102, 236,35);

        [self.view addSubview:activateCode];
        [self.view addSubview:activateButton];
        // Custom initialization
    }
    return self;
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
