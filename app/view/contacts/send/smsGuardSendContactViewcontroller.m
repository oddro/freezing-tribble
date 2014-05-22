//
//  smsGuardSendContactViewcontroller.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/22/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardSendContactViewcontroller.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface smsGuardSendContactViewcontroller ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation smsGuardSendContactViewcontroller
float tableHeight = 30;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose"]];
        self.title = @"Send Contact";
        phone_numb = [[UITextField alloc]initWithFrame:CGRectMake(30, 50, 236,35)];
        phone_numb.backgroundColor = [UIColor clearColor];
        phone_numb.returnKeyType  = UIReturnKeyGo;
        phone_numb.delegate = self;
        phone_numb.font = [UIFont fontWithName:fontDefault size:14];
        
        //Autocomplete Table
        autoCompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(25, 168/2, 270, tableHeight) style:UITableViewStylePlain];
        autoCompleteTableView.delegate = self;
        autoCompleteTableView.dataSource = self;
        autoCompleteTableView.scrollEnabled = YES;
        autoCompleteTableView.hidden = YES;
        autoCompleteTableView.rowHeight = tableHeight;
        
        select_contact = [UIButton buttonWithType:UIButtonTypeCustom];
        select_contact.frame =CGRectMake(266, 45, 76/2, 76/2);
        select_contact.backgroundColor = [UIColor clearColor];
        [select_contact addTarget:self action:@selector(openAddressBook) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"elements.txt" ofType:nil];
        NSData* data = [NSData dataWithContentsOfFile:filePath];
        
        //Convert the bytes from the file into a string
        NSString* string = [[NSString alloc] initWithBytes:[data bytes]
                                                    length:[data length]
                                                  encoding:NSUTF8StringEncoding];
        
        //Split the string around newline characters to create an array
        NSString* delimiter = @"\n";
        NSArray *item = [string componentsSeparatedByString:delimiter];
        elementArray = [[NSMutableArray alloc] initWithArray:item];
        autoCompleteArray = [[NSMutableArray alloc] init];
        
       
        [self.view addSubview:phone_numb];
        [self.view addSubview:autoCompleteTableView];
        [self.view addSubview:select_contact];
    }
    return self;
}
-(void)openAddressBook{
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        //1
        NSLog(@"Denied");
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        //2
        ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        picker.peoplePickerDelegate = self;
        
        [self.navigationController presentViewController:picker animated:YES completion:nil];
    } else{
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            if (!granted){
                //4
                NSLog(@"Just denied");
                return;
            }
            else{
                ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
                picker.peoplePickerDelegate = self;
                
                [self.navigationController presentViewController:picker animated:YES completion:nil];
            }
            //5
            
        });
    }
}
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    NSString* name = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    phone_numb.text = name;
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

// Take string from Search Textfield and compare it with autocomplete array
- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
	
	// Put anything that starts with this substring into the autoCompleteArray
	// The items in this array is what will show up in the table view
	
	[autoCompleteArray removeAllObjects];
    
	for(NSString *curString in elementArray) {
		NSRange substringRangeLowerCase = [curString rangeOfString:[substring lowercaseString]];
		NSRange substringRangeUpperCase = [curString rangeOfString:[substring uppercaseString]];
        
		if (substringRangeLowerCase.length != 0 || substringRangeUpperCase.length != 0) {
			[autoCompleteArray addObject:curString];
		}
	}
	
	autoCompleteTableView.hidden = NO;
	[autoCompleteTableView reloadData];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
	[super touchesBegan:touches withEvent:event];
	[self finishedSearching];
}

#pragma mark UITextFieldDelegate methods

// Close keyboard when Enter or Done is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	BOOL isDone = YES;
	
	if (isDone) {
		[self finishedSearching];
		return YES;
	} else {
		return NO;
	}
}

// String in Search textfield
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	NSString *substring = [NSString stringWithString:textField.text];
	substring = [substring stringByReplacingCharactersInRange:range withString:string];
	[self searchAutocompleteEntriesWithSubstring:substring];
	return YES;
}

#pragma mark UITableViewDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    
	//Resize auto complete table based on how many elements will be displayed in the table
	if (autoCompleteArray.count >=3) {
		autoCompleteTableView.frame = CGRectMake(25, 168/2, 270, tableHeight*3);
		return autoCompleteArray.count;
	}
	
	else if (autoCompleteArray.count == 2) {
		autoCompleteTableView.frame = CGRectMake(25, 168/2, 270, tableHeight*2);
		return autoCompleteArray.count;
	}
	else if (autoCompleteArray.count == 0) {
        autoCompleteTableView.frame = CGRectMake(25, 168/2, 270, tableHeight*0);
        return autoCompleteArray.count;
    }
	else {
		autoCompleteTableView.frame = CGRectMake(25, 168/2, 270, tableHeight);
		return autoCompleteArray.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
	static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
	cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
	}
    cell.textLabel.font = [UIFont fontWithName:fontDefault size:15];
	cell.textLabel.text = [autoCompleteArray objectAtIndex:indexPath.row];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
	phone_numb.text = selectedCell.textLabel.text;
	[self finishedSearching];
}
- (void) finishedSearching {
	[phone_numb resignFirstResponder];
	autoCompleteTableView.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
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
