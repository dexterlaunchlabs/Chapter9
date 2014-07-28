//
//  BIDRowControlsController.m
//  Nav
//
//  Created by Dexter Launchlabs on 7/28/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDRowControlsController.h"

@interface BIDRowControlsController ()

@end

@implementation BIDRowControlsController
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
    NSArray *array = [[NSArray alloc] initWithObjects:@"R2-D2",
                      @"C3PO", @"Tik-Tok", @"Robby", @"Rosie", @"Uniblab", @"Bender", @"Marvin", @"Lt. Commander Data",
                      @"Evil Brother Lore", @"Optimus Prime", @"Tobor", @"HAL",
                      @"Orgasmatron", nil]; self.list = array;
}
- (void)viewDidUnload { [super viewDidUnload]; self.list = nil;
}
- (IBAction)buttonTapped:(id)sender {
    UIButton *senderButton = (UIButton *)sender; UITableViewCell *buttonCell =
    (UITableViewCell *)[senderButton superview]; NSUInteger buttonRow = [[self.tableView
                                                                          indexPathForCell:buttonCell] row];
    NSString *buttonTitle = [list objectAtIndex:buttonRow]; UIAlertView *alert = [[UIAlertView alloc]
                                                                                  initWithTitle:@"You tapped the button" message:[NSString stringWithFormat:
                                                                                                                                  @"You tapped the button for %@", buttonTitle] delegate:nil
                                                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section { return [list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ControlRowIdentifier = @"ControlRowIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ControlRowIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:ControlRowIdentifier];
        UIImage *buttonUpImage = [UIImage imageNamed:@"button_up.png"]; UIImage *buttonDownImage = [UIImage imageNamed:@"button_down.png"]; UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom]; button.frame = CGRectMake(0.0, 0.0, buttonUpImage.size.width,
                                                                                                                                                                                                                                       buttonUpImage.size.height);
        [button setBackgroundImage:buttonUpImage
                          forState:UIControlStateNormal]; [button setBackgroundImage:buttonDownImage
                                                                            forState:UIControlStateHighlighted];
        [button setTitle:@"Tap" forState:UIControlStateNormal]; [button addTarget:self action:@selector(buttonTapped:)
                                                                 forControlEvents:UIControlEventTouchUpInside]; cell.accessoryView = button;
    }
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row]; cell.textLabel.text = rowTitle;
    return cell; }
#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath { NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row]; UIAlertView *alert = [[UIAlertView alloc]
                                                                         initWithTitle:@"You tapped the row." message:[NSString
                                                                                                                       stringWithFormat:@"You tapped %@.", rowTitle] delegate:nil
                                                                         cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; }
@end
