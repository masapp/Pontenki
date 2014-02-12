//
//  ViewController.h
//  pontenki
//
//  Created by masapp on 2013/12/06.
//  Copyright (c) 2013年 masapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <NSXMLParserDelegate> {
    
    // Section1
    // IBOutlet UIImageView *todayWeather;
    IBOutlet UILabel *todayWeather;
    IBOutlet UILabel *todayTemperature;
    IBOutlet UILabel *todayHumidity;
    
    // Section2
    // IBOutlet UIImageView *tomorrowWeather;
    IBOutlet UILabel *tomorrowWeather;
    IBOutlet UILabel *tomorrowTemperature;
    IBOutlet UILabel *tomorrowHumidity;
    
    // Segmented
    IBOutlet UISegmentedControl *unit;
    
    NSMutableArray *date;
    NSMutableArray *weather;
    NSMutableArray *temperatures;
    NSMutableArray *humidities;
}

@end
