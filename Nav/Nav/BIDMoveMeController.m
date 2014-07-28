//
//  BIDMoveMeController.m
//  Nav
//
//  Created by Dexter Launchlabs on 7/28/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDMoveMeController.h"

@interface BIDMoveMeController ()

@end

@implementation BIDMoveMeController
@synthesize list;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (list == nil) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"Eeny", @"Meeny", @"Miney", @"Moe", @"Catch", @"A", @"Tiger", @"By", @"The", @"Toe", nil];
        self.list = array; }
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc] initWithTitle:@"Move"
                                                                   style:UIBarButtonItemStyleBordered target:self action:@selector(toggleMove)];
    self.navigationItem.rightBarButtonItem = moveButton;
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
- (IBAction)toggleMove {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    else
        [self.navigationItem.rightBarButtonItem setTitle:@"Move"];
}
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section { return [list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MoveMeCellIdentifier = @"MoveMeCellIdentifier"; UITableViewCell *cell = [tableView
                                                                                              dequeueReusableCellWithIdentifier:MoveMeCellIdentifier]; if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MoveMeCellIdentifier];
        cell.showsReorderControl = YES; }
    NSUInteger row = [indexPath row]; cell.textLabel.text = [list objectAtIndex:row];
    return cell; }
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone; }
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES; }
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath { NSUInteger fromRow = [fromIndexPath row]; NSUInteger toRow = [toIndexPath row];
    id object = [list objectAtIndex:fromRow]; [list removeObjectAtIndex:fromRow];
    [list insertObject:object atIndex:toRow];
}
@end
