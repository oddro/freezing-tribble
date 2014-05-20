//
//  enervoLoginViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/20/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "enervoLoginViewController.h"

@interface enervoLoginViewController ()

@end

@implementation enervoLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sign_window"]];
        self.title =@"Sign In";
        password = [[UITextField alloc]initWithFrame:CGRectMake(30, 178, 251,35)];
        password.backgroundColor = [UIColor clearColor];
        password.returnKeyType  = UIReturnKeyGo;
        password.delegate = self;
        password.font = [UIFont fontWithName:fontDefault size:14];
        password.placeholder = @"Your Password";
        
        sign_in = [UIButton buttonWithType:UIButtonTypeCustom];
        sign_in.frame = CGRectMake(20, 226, 134, 37);
        [sign_in addTarget:self action:@selector(sign:) forControlEvents:UIControlEventTouchUpInside];
        
        sign_in.backgroundColor = [UIColor clearColor];
        
        forget_password = [UIButton buttonWithType:UIButtonTypeCustom];
        forget_password.frame = CGRectMake(162, 226, 134, 37);
        [forget_password addTarget:self action:@selector(forget:) forControlEvents:UIControlEventTouchUpInside];
        
        
        forget_password.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:password];
        [self.view addSubview:sign_in];
        [self.view addSubview:forget_password];
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.text.length <=0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Password Can't be nil" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        [enrv signinToServer];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    return YES;
}
-(void)forget:(id)sender{

}
-(void)sign:(id)sender{
    if(password.text.length <=0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Password Can't be nil" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        [enrv signinToServer];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }

    
}
-(void)forgot_password:(id)sender{
    
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
