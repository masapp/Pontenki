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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setCheckMark];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self setCheckMark];
}

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

- (void)setCheckMark
{
    // Get data for save
    NSUserDefaults *cityData = [NSUserDefaults standardUserDefaults];
    cityName = [cityData stringForKey:@"CITY"];
    
    // Get display cell data
    NSArray *cells = [self.tableView visibleCells];
    
    for (NSInteger i = 0; i < [cells count]; i++) {
        UITableViewCell *cell = cells[i];
        if ([cell.textLabel.text isEqualToString:cityName]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

@end
