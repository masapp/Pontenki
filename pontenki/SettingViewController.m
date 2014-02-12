//
//  SettingViewController.m
//  pontenki
//
//  Created by masapp on 2014/02/01.
//  Copyright (c) 2014年 masapp. All rights reserved.
//

#import "SettingViewController.h"


@implementation SettingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the selected cell data
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cityName = cell.textLabel.text;
    
    // Save selected cell data
    NSUserDefaults *cityData = [NSUserDefaults standardUserDefaults];
    [cityData setObject:cityName forKey:@"CITY"];
    
    // Check in the selected cell
    UITableViewCell *checkedCell = [tableView cellForRowAtIndexPath:checkMark];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        checkedCell.accessoryType = UITableViewCellAccessoryNone;
        checkMark = indexPath;
    }
}


@end
