//
//  BIDPresident.h
//  Nav
//
//  Created by Dexter Launchlabs on 7/28/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kPresidentNumberKey @"President"
#define kPresidentNameKey @"Name"
#define kPresidentFromKey @"FromYear"
#define kPresidentToKey @"ToYear"
#define kPresidentPartyKey @"Party"

@interface BIDPresident : NSObject <NSCoding>

@property int number;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *fromYear;
@property (nonatomic,copy) NSString *toYear;
@property (nonatomic,copy) NSString *party;
           
@end
