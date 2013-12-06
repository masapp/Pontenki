//
//  ViewController.m
//  pontenki
//
//  Created by masapp on 2013/12/06.
//  Copyright (c) 2013年 masapp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // get the temperature data saved in settingViewController.
    NSUserDefaults *cityData = [NSUserDefaults standardUserDefaults];
    NSString *woeid = [cityData stringForKey:@"CITY"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)CfromF:(int)_fahrenheit
{
    return 5.0 / 9.0 * (_fahrenheit - 32);
}

@end
