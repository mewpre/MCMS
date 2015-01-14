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

    NSArray *winnersArray = [self getWinners];
    self.winnerLabel.text = [NSString stringWithFormat:@"%@ is the winner!!",
                             [[winnersArray objectAtIndex:0] getCreatureName]];
    self.winnerImage.image = [[winnersArray objectAtIndex:0] getCreatureImage];
    self.secondPlaceLabel.text = [[winnersArray objectAtIndex:1] getCreatureName];
    self.thirdPlaceLabel.text = [[winnersArray objectAtIndex:2] getCreatureName];
}

/*  Adds up the damage dealt by each creature given the accessories and puts it in an array,
    then finds the creatures that dealt the most damage and adds them to the winnerArray.
    The creature and the sum are then removed to find the second place creature, and again to 
    get the third place creature.
*/
- (NSArray *)getWinners
{
    NSMutableArray *damageCountSumsArray = [[NSMutableArray alloc] init];
    NSMutableArray *winnersArray = [[NSMutableArray alloc] init];
    NSMutableArray *competitorsArray = [self.magicalCreaturesArray mutableCopy];
    //Loops through creatures in magicalCreaturesArray
    for (MagicalCreature *creature in self.magicalCreaturesArray)
    {
        int sum = 0;
        //Loops through array of creature accessories and adds the damage count of equipped accessories
        for (CreatureAccessory *creatureAccessory in [creature getCreatureAccessories])
        {
            if ([creatureAccessory isCreatureAccessoryEquipped])
            {
                sum += [creatureAccessory getCreatureAccessoryDamageCount];
            }
        }
        [damageCountSumsArray addObject:[NSNumber numberWithInteger:sum]];
    }
    //Loops to find the top 3 creatures
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
