//
//  battleViewController.m
//  MCMS
//
//  Created by Tewodros Wondimu on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "BattleViewController.h"
#import "CreatureAccessory.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdPlaceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *winnerImage;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [self getWinners]);
    self.winnerLabel.text = [NSString stringWithFormat:@"%@ is the Winner",
                             [[[self getWinners] objectAtIndex:0] getCreatureName]];
    self.winnerImage.image = [[[self getWinners] objectAtIndex:0] getCreatureImage];
    self.secondPlaceLabel.text = [[[self getWinners] objectAtIndex:1] getCreatureName];
    self.thirdPlaceLabel.text = [[[self getWinners] objectAtIndex:2] getCreatureName];
}

- (NSArray *)getWinners
{
    NSMutableArray *damageCountSumsArray = [[NSMutableArray alloc] init];
    NSMutableArray *winnersArray = [[NSMutableArray alloc] init];
    NSMutableArray *competitorsArray = [self.magicalCreaturesArray mutableCopy];
    for (MagicalCreature *creature in self.magicalCreaturesArray)
    {
        int sum = 0;
        for (CreatureAccessory *creatureAccessory in [creature getCreatureAccessories])
        {
            if ([creatureAccessory isCreatureAccessoryEquipped])
            {
                sum += [creatureAccessory getCreatureAccessoryDamageCount];
            }
        }
        [damageCountSumsArray addObject:[NSNumber numberWithInteger:sum]];
    }
    for (int count = 0; count < 3; count++)
    {
        NSNumber *highestDamageCount = [damageCountSumsArray valueForKeyPath:@"@max.intValue"];
        NSInteger index = [damageCountSumsArray indexOfObject:highestDamageCount];
        [damageCountSumsArray removeObjectAtIndex:index];
        MagicalCreature *winningCreature = [competitorsArray objectAtIndex:index];
        [competitorsArray removeObjectAtIndex:index];
        [winnersArray addObject:winningCreature];
    }
    return winnersArray;

}

- (IBAction)onCloseButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
