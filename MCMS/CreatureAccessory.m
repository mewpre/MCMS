//
//  CreatureAccessories.m
//  MCMS
//
//  Created by Tewodros Wondimu on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "CreatureAccessory.h"

@interface CreatureAccessory ()

@property NSString *name;
@property int damageCount;

@end

@implementation CreatureAccessory

-(NSString *)getCreatureAccessoryName
{
    return self.name;
}

-(int)getCreatureAccessoryDamageCount
{
    return self.damageCount;
}

-(instancetype) initWithCreatureName:(NSString *)creatureName damageCount:(int)damageCount
{
    self = [super init];
    if (self)
    {
        self.name = creatureName;
        self.damageCount = damageCount;
    }
    return self;
}

@end
