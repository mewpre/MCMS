//
//  CreatureAccessories.h
//  MCMS
//
//  Created by Tewodros Wondimu on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreatureAccessory : NSObject

-(NSString *)getCreatureAccessoryName;
-(int)getCreatureAccessoryDamageCount;
-(BOOL)isCreatureAccessoryEquipped;

-(void)toggleCreatureAccessoryEquipStatus;
-(instancetype) initWithCreatureName:(NSString *)creatureName damageCount:(int)damageCount;


@end
