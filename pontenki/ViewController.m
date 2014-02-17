//
//  ViewController.m
//  pontenki
//
//  Created by masapp on 2013/12/06.
//  Copyright (c) 2013年 masapp. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize the array for wearther data
    date = [NSMutableArray arrayWithObjects:@"", @"", nil];
    weather = [NSMutableArray arrayWithObjects:@"unknown", @"unknown", nil];
    temperatures = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", nil];
    humidities = [NSMutableArray arrayWithObjects:@"0", @"0", nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Get the city name saved in settingViewController.
    NSUserDefaults *cityData = [NSUserDefaults standardUserDefaults];
    NSString *cityName = [cityData stringForKey:@"CITY"];
    if (cityName == nil) {
        cityName = @"London";
    }
    
    // Get the wearther data from API
    NSString *URLString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&mode=xml&units=metric&cnt=2", cityName];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:URLString]];
    [parser setDelegate:self];
    [parser parse];
    
    // Set navigation title
    self.navigationItem.title = cityName;
    
    // Set weather data
    if ([weather count] > 2) {
        [weather removeObjectsInRange:NSMakeRange(0, 2)];
    }
    todayWeather.text = [NSString stringWithFormat:@"%@", [weather objectAtIndex:0]];
    tomorrowWeather.text = [NSString stringWithFormat:@"%@", [weather objectAtIndex:1]];
    
    // Set humidity data
    if ([humidities count] > 2) {
        [humidities removeObjectsInRange:NSMakeRange(0, 2)];
    }
    todayHumidity.text = [NSString stringWithFormat:@"%@％", [humidities objectAtIndex:0]];
    tomorrowHumidity.text = [NSString stringWithFormat:@"%@％", [humidities objectAtIndex:1]];
    
    // Set temperature data
    [self setTemperature];
    
    // Call segment value changed
    [unit addTarget:self action:@selector(changeUnit:) forControlEvents:UIControlEventValueChanged];
}

// Change the header of section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([date count] > 2) {
        [date removeObjectsInRange:NSMakeRange(0, 2)];
    }
    return [date objectAtIndex:section];
}

// Raceive API response
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // NSLog(@"%@ %@", elementName, attributeDict);
    if ([elementName isEqual:@"time"]) {
        [date addObject:[attributeDict objectForKey:@"day"]];
    }
    if ([elementName isEqual:@"symbol"]) {
        [weather addObject:[attributeDict objectForKey:@"name"]];
    }
    if ([elementName isEqual:@"temperature"]) {
        [temperatures addObject:[attributeDict objectForKey:@"max"]];
        [temperatures addObject:[attributeDict objectForKey:@"min"]];
    }
    if ([elementName isEqual:@"humidity"]) {
        [humidities addObject:[attributeDict objectForKey:@"value"]];
    }
}

// Change temperature unit
- (void)changeUnit:(UISegmentedControl *)segment
{
    [self setTemperature];
}

// Set temperature data 
- (void)setTemperature
{
    if ([temperatures count] > 4) {
        [temperatures removeObjectsInRange:NSMakeRange(0, 4)];
    }
    float todayMax = [[temperatures objectAtIndex:0] floatValue];
    float todayMin = [[temperatures objectAtIndex:1] floatValue];
    float tomorrowMax = [[temperatures objectAtIndex:2] floatValue];
    float tomorrowMin = [[temperatures objectAtIndex:3] floatValue];

    if (unit.selectedSegmentIndex == 1) {
        todayMax = [self FfromC:todayMax];
        todayMin = [self FfromC:todayMin];
        tomorrowMax = [self FfromC:tomorrowMax];
        tomorrowMin = [self FfromC:tomorrowMin];
    }
    todayTemperature.text = [NSString stringWithFormat:@"%.1f / %.1f", todayMax, todayMin];
    tomorrowTemperature.text = [NSString stringWithFormat:@"%.1f / %.1f", tomorrowMax, tomorrowMin];
}

// Convert Celsius to Fahrenheit
- (float)FfromC:(float)Celsius
{
    return 9.0 / 5.0 * (Celsius + 32);
}

@end
