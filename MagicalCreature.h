//
//  MagicalCreature.h
//  MCMS
//
//  Created by Yi-Chin Sun on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

-(instancetype)initWithName: (NSString *)name description:(NSString *) description accessories: (NSMutableArray *)accessories image: (UIImage *)image;
-(NSString *)getCreatureName;

@end
