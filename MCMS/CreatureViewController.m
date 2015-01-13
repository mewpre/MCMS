//
//  CreatureViewController.m
//  MCMS
//
//  Created by Tewodros Wondimu on 1/13/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureDetailTextField;
@property BOOL inEditMode;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.inEditMode = NO;
    self.editCreatureDetailTextField.hidden = YES;
    self.editCreatureNameTextField.hidden = YES;

    self.creatureNameLabel.text = [self.magicalCreature getCreatureName];
    self.creatureDetailLabel.text = [self.magicalCreature getCreatureDetail];
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender
{
    if (!self.inEditMode)
    {
        sender.title = @"Done";
    }
    else
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

@end
