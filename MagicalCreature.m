//
//  MagicalCreature.m
//  MCMS
//
//  Created by Yi-Chin Sun on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "MagicalCreature.h"

@interface MagicalCreature ()

@property NSString *name;
@property NSString *creatureDescription;
@property NSMutableArray *accessories;

@end

@implementation MagicalCreature

-(instancetype)initWithName: (NSString *)name description:(NSString *) description accessories: (NSMutableArray *)accessories image: (UIImage *)image
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.creatureDescription = description;
    }
    return self;
}

-(NSString *)getCreatureName
{
    return self.name;
}

@end
