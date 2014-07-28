//
//  BIDPresident.m
//  Nav
//
//  Created by Dexter Launchlabs on 7/28/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDPresident.h"

@implementation BIDPresident

@synthesize number;
@synthesize name;
@synthesize fromYear;
@synthesize toYear;
@synthesize party;

#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInt:self.number forKey:kPresidentNumberKey];
    [coder encodeObject:self.name forKey:kPresidentNameKey];
    [coder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [coder encodeObject:self.toYear forKey:kPresidentToKey];
    [coder encodeObject:self.party forKey:kPresidentPartyKey];
}
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
    number = [coder decodeIntForKey:kPresidentNumberKey];
    name = [coder decodeObjectForKey:kPresidentNameKey];
    fromYear = [coder decodeObjectForKey:kPresidentFromKey];
    toYear = [coder decodeObjectForKey:kPresidentToKey];
    party = [coder decodeObjectForKey:kPresidentPartyKey];
   }
    return self;
}
@end
