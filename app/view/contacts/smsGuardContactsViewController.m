//
//  smsGuardContactsViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardContactsViewController.h"
#import "smsGuardSendContactViewcontroller.h"
@interface smsGuardContactsViewController ()

@end

@implementation smsGuardContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
        self.title = [NSString stringWithFormat:NSLocalizedString(@"Contact",nil)];
        
        
        contact  =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-(64+50))];
        contact.delegate = self;
        contact.dataSource = self;
        
        
        
        //init dummy
        contacts_name_IndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"phone" ofType:@"plist"];
        data_contact = [[NSMutableArray alloc]initWithContentsOfFile:path];
        
      
        contacts_name_section = [[[data_contact objectAtIndex:0] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        searchBar.delegate = self;
        
        /*the search bar widht must be > 1, the height must be at least 44
         (the real size of the search bar)*/
        
        searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
        /*contents controller is the UITableViewController, this let you to reuse
         the same TableViewController Delegate method used for the main table.*/
        
        searchDisplayController.delegate = self;
        searchDisplayController.searchResultsDataSource = self;
        //set the delegate = self. Previously declared in ViewController.h
        
        contact.tableHeaderView = searchBar; //this line add the searchBar
        //on the top of tableView.
        UIButton *button1 = [[UIButton alloc] init];
        button1.frame=CGRectMake(0,0,54,45);
        
        [button1 setBackgroundImage:[UIImage imageNamed: @"smsguard-iphone-contact-button-add"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(composeNew:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *right_bar =[[UIBarButtonItem alloc]initWithCustomView:button1];
        right_bar.imageInsets = UIEdgeInsetsMake(0.0, 20, 0, -20);
        
        self.navigationItem.rightBarButtonItem = right_bar;
        [self.view addSubview:contact];
    }
    return self;
}
-(void)composeNew:(id)sender{
    smsGuardSendContactViewcontroller *new = [[smsGuardSendContactViewcontroller alloc]init];
    [self.navigationController pushViewController:new animated:YES];
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        // Return the number of sections.
        return [contacts_name_section count];
        
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [contacts_name_section objectAtIndex:section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [contacts_name_section objectAtIndex:section];
    NSArray *sectionAnimals = [[data_contact objectAtIndex:0] objectForKey:sectionTitle];
    return [sectionAnimals count];
}
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return contacts_name_IndexTitles;
//}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBar button clicked");
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarCancelButtonClicked button clicked");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cells = @"cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cells];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        NSString *sectionTitle = [contacts_name_section objectAtIndex:indexPath.section];
        NSArray *sectionAnimals = [[data_contact objectAtIndex:0] objectForKey:sectionTitle];
        
        cell.textLabel.font = [UIFont fontWithName:fontDefault size:17];
        cell.textLabel.text = [[sectionAnimals objectAtIndex:indexPath.row]objectForKey:@"name"];
        
        cell.detailTextLabel.font =[UIFont fontWithName:fontDefault size:14];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        cell.detailTextLabel.text = [[sectionAnimals objectAtIndex:indexPath.row]objectForKey:@"phone"];
        // cell.imageView.image = [UIImage imageNamed:[self getImageFilename:animal]];
    }
    return cell;
}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    NSLog(@"resultPredicate->%@",searchData);

    searchResults = [searchData filteredArrayUsingPredicate:resultPredicate];
    
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
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
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
