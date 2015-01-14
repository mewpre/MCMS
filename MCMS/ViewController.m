//
//  ViewController.m
//  MCMS
//
//  Created by Yi-Chin Sun on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "CreatureAccessory.h"
#import "BattleViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDetailTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *battleButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSMutableArray *creatureAccessories1 = [self createCreatureAccessories];
    NSMutableArray *creatureAccessories2 = [self createCreatureAccessories];
    NSMutableArray *creatureAccessories3 = [self createCreatureAccessories];
    UIImage *unicornImage = [UIImage imageNamed:@"unicorn"];
    UIImage *griffinImage = [UIImage imageNamed:@"griffin"];
    UIImage *dragonImage = [UIImage imageNamed:@"dragon"];
    MagicalCreature *unicorn = [[MagicalCreature alloc]initWithName:@"unicorn" detail:@"magical horse with horn" accessories:creatureAccessories1 image:unicornImage];
    MagicalCreature *griffin = [[MagicalCreature alloc]initWithName:@"griffin" detail:@"half eagle half lion" accessories:creatureAccessories2 image:griffinImage];
    MagicalCreature *dragon = [[MagicalCreature alloc]initWithName:@"dragon" detail: @"giant fire-breathing lizard" accessories:creatureAccessories3 image:dragonImage];
    self.creatures = [NSMutableArray arrayWithObjects:unicorn, griffin, dragon, nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.listTableView dequeueReusableCellWithIdentifier:@"creatureCellID"];
    MagicalCreature *selectedMagicalCreature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = [selectedMagicalCreature getCreatureName];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

- (IBAction)addButtonTapped:(UIButton *)sender
{
    NSMutableArray *creatureAccessories = [self createCreatureAccessories];
    UIImage *creatureImage = [UIImage imageNamed:@"question"];
    MagicalCreature *newCreature = [[MagicalCreature alloc]initWithName:self.creatureNameTextField.text detail:self.creatureDetailTextField.text accessories:creatureAccessories image:creatureImage];
    [self.creatures addObject:newCreature];
    self.creatureNameTextField.text = @"";
    self.creatureDetailTextField.text = @"";
    [self.listTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIView *)sender
{
    // Battle button tag is 0
    if (sender.tag == 0) {
        BattleViewController *battleVC = [segue destinationViewController];
        battleVC.magicalCreaturesArray = (NSArray *)self.creatures;
    }
    // Cell tag is 1
    else if (sender.tag == 1)
    {
        UITableViewCell *cell = (UITableViewCell *)sender;

        CreatureViewController *cvc = segue.destinationViewController;
        // Find the index path from the selected table view cell
        // and use that to find the index of the creature in the creature array
        cvc.magicalCreature = [self.creatures objectAtIndex:[[self.listTableView indexPathForCell:cell] row]];
    }
}

- (NSMutableArray *)createCreatureAccessories {
    CreatureAccessory *firstAccessory = [[CreatureAccessory alloc] initWithCreatureName:@"Spoon" damageCount:40 ];
    CreatureAccessory *secondAccessory = [[CreatureAccessory alloc] initWithCreatureName:@"Cheese" damageCount:5];
    CreatureAccessory *thirdAccessory = [[CreatureAccessory alloc] initWithCreatureName:@"Gold" damageCount:67];
    CreatureAccessory *fourthAccessory = [[CreatureAccessory alloc] initWithCreatureName:@"Rubber Duck" damageCount:18];

    NSMutableArray *creatureAccessories = [NSMutableArray arrayWithObjects:firstAccessory, secondAccessory, thirdAccessory, fourthAccessory, nil];
    return creatureAccessories;
}

@end
