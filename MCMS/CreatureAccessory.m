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
@property BOOL isEquipped;

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

-(BOOL)isCreatureAccessoryEquipped
{
    return self.isEquipped;
}

-(void)toggleCreatureAccessoryEquipStatus
{
    self.isEquipped = !self.isEquipped;
}

-(instancetype) initWithAccessoryName:(NSString *)accessoryName
                         damageCount:(int)damageCount
{
    self = [super init];
    if (self)
    {
        self.name = accessoryName;
        self.damageCount = damageCount;
        self.isEquipped = NO;
    }
    return self;
}

@end
