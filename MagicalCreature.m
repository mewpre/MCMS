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
@property NSString *detail;
@property NSMutableArray *accessoriesArray;
@property UIImage *image;

@end

@implementation MagicalCreature

-(instancetype)initWithName: (NSString *)name detail:(NSString *) detail accessories: (NSMutableArray *)accessories image: (UIImage *)image
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.detail = detail;
        self.image = image;
        self.accessoriesArray = accessories;
    }
    return self;
}

-(NSString *)getCreatureName
{
    return self.name;
}

-(NSString *)getCreatureDetail
{
    return self.detail;
}

-(UIImage *)getCreatureImage
{
    return self.image;
}

-(NSMutableArray *)getCreatureAccessories
{
    return self.accessoriesArray;
}

-(void)setCreatureName: (NSString *)name
{
    self.name = name;
}

-(void)setCreatureDetail: (NSString *)detail
{
    self.detail = detail;
}

@end
