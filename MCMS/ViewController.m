//
//  ViewController.m
//  MCMS
//
//  Created by Yi-Chin Sun on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDetailTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *creatureAccessories = [NSMutableArray arrayWithObjects:@"Spoon", @"Cheese", @"Gold", @"Rubber Duck",  nil];
    UIImage *creatureImage = [UIImage imageNamed:@"trogdor"];
    MagicalCreature *unicorn = [[MagicalCreature alloc]initWithName:@"unicorn" description:@"magical horse with horn" accessories:creatureAccessories image:creatureImage];
    MagicalCreature *griffin = [[MagicalCreature alloc]initWithName:@"griffin" description:@"half eagle half lion" accessories:creatureAccessories image:creatureImage];
    MagicalCreature *dragon = [[MagicalCreature alloc]initWithName:@"dragon" description: @"giant fire-breathing lizard" accessories:creatureAccessories image:creatureImage];
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
    NSMutableArray *creatureAccessories = [NSMutableArray arrayWithObjects:@"Spoon", @"Cheese", @"Gold", @"Rubber Duck",  nil];
    UIImage *creatureImage = [UIImage imageNamed:@"trogdor"];
    MagicalCreature *newCreature = [[MagicalCreature alloc]initWithName:self.creatureNameTextField.text description:self.creatureDetailTextField.text accessories:creatureAccessories image:creatureImage];
    [self.creatures addObject:newCreature];
    self.creatureNameTextField.text = @"";
    self.creatureDetailTextField.text = @"";
    [self.listTableView reloadData];
}
@end
