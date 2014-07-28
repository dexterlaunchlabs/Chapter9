//
//  BIDCheckListController.h
//  Nav
//
//  Created by Dexter Launchlabs on 7/28/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDSecondLevelViewController.h"

@interface BIDCheckListController : BIDSecondLevelViewController
@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;

@end
