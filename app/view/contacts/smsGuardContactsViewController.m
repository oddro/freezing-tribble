//
//  smsGuardContactsViewController.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "smsGuardContactsViewController.h"

@interface smsGuardContactsViewController ()

@end

@implementation smsGuardContactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
        self.title = @"Contact";
        
        
        contact  =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-(64+50))];
        contact.delegate = self;
        contact.dataSource = self;
        
        
        
        //init dummy
        contacts_name_IndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];

        contacts_name = @{@"A" : @[
                                  @[@"Arie",@"081555957513"],
                                  @[@"Asen",@"081555957513"],
                                  @[@"Abri",@"081555957513"]],
                          @"B" : @[
                                  @[@"Bungkring",@"081555957513"],
                                  @[@"Bungkarno",@"081555957513"],
                                  @[@"Bung Hatta",@"081555957513"]],
                          @"C" : @[
                                  @[@"Cungkring",@"081555957513"],
                                  @[@"Cungkarno",@"081555957513"],
                                  @[@"Cung Hatta",@"081555957513"]]
                          };
        
        contacts_name_section = [[contacts_name allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        data_contact = [[NSMutableArray alloc]init];
        
        searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
       
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
        
        [self.view addSubview:contact];
    }
    return self;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [contacts_name_section count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [contacts_name_section objectAtIndex:section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [contacts_name_section objectAtIndex:section];
    NSArray *sectionAnimals = [contacts_name objectForKey:sectionTitle];
    return [sectionAnimals count];
}
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return contacts_name_IndexTitles;
//}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBar button clicked");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cells = @"cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cells];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cells];
    }
    NSString *sectionTitle = [contacts_name_section objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [contacts_name objectForKey:sectionTitle];
    NSString *name = [[sectionAnimals objectAtIndex:indexPath.row]objectAtIndex:0];
    NSString *number = [[sectionAnimals objectAtIndex:indexPath.row]objectAtIndex:1];
    cell.textLabel.text = name;
    cell.detailTextLabel.text = number;
   // cell.imageView.image = [UIImage imageNamed:[self getImageFilename:animal]];
    
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
