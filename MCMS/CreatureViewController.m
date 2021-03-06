//
//  CreatureViewController.m
//  MCMS
//
//  Created by Tewodros Wondimu on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "CreatureViewController.h"
#import "CreatureAccessory.h"

@interface CreatureViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureDetailTextField;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *accessoriesTableView;
@property BOOL inEditMode;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.inEditMode = NO;
    self.editCreatureDetailTextField.hidden = YES;
    self.editCreatureNameTextField.hidden = YES;

    self.editCreatureDetailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.editCreatureNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    self.creatureImageView.image = [self.magicalCreature getCreatureImage];
    self.creatureNameLabel.text = [self.magicalCreature getCreatureName];
    self.creatureDetailLabel.text = [self.magicalCreature getCreatureDetail];
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender
{
    if (!self.inEditMode)
    {
        sender.title = @"Done";
    }
    //Executes only if both editCreatureNameTextField and editCreatureDetailTextField are not empty
    else if (!([self.editCreatureNameTextField isEqual:@""] || [self.editCreatureDetailTextField isEqual:@""]))
    {
        sender.title = @"Edit";
        NSString *newName = self.editCreatureNameTextField.text;
        NSString *newDetail = self.editCreatureDetailTextField.text;
        [self.magicalCreature setCreatureName:newName];
        [self.magicalCreature setCreatureDetail:newDetail];

        self.creatureNameLabel.text = newName;
        self.creatureDetailLabel.text = newDetail;

    }
    //When in edit mode, text field isn't hidden
    self.editCreatureDetailTextField.hidden = self.inEditMode;
    self.editCreatureNameTextField.hidden = self.inEditMode;
    self.inEditMode = !self.inEditMode;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.magicalCreature getCreatureAccessories] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.accessoriesTableView dequeueReusableCellWithIdentifier:@"accessoryCellID"];
    CreatureAccessory *accessoryAtCell = [[self.magicalCreature getCreatureAccessories] objectAtIndex:indexPath.row];
    cell.textLabel.text = [accessoryAtCell getCreatureAccessoryName];
    if ([accessoryAtCell isCreatureAccessoryEquipped])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CreatureAccessory *selectedAccessory = [[self.magicalCreature getCreatureAccessories] objectAtIndex:indexPath.row];
    [selectedAccessory toggleCreatureAccessoryEquipStatus];
    [self.accessoriesTableView reloadData];
}



@end
