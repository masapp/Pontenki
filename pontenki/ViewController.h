//
//  ViewController.h
//  pontenki
//
//  Created by masapp on 2013/12/06.
//  Copyright (c) 2013年 masapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate> {
    
    // section1
    IBOutlet UIImageView *todayWeather;
    IBOutlet UILabel *todayTemperature;
    IBOutlet UILabel *todayHumidity;
    
    // section2 
    IBOutlet UIImageView *tomorrowWeather;
    IBOutlet UILabel *tomorrowTemperature;
    IBOutlet UILabel *tomorrowHumidity;

    // API response data.
    NSMutableData *weatherData;
}

@end
