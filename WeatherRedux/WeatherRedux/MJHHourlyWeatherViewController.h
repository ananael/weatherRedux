//
//  MJHHourlyWeatherViewController.h
//  weatherTryout
//
//  Created by Michael Hoffman on 9/25/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJHDataConversionMethods.h"
#import "MJHDailyWeatherViewController.h"
#import "ViewController.h"


@interface MJHHourlyWeatherViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *resultsDictionary;
@property (strong, nonatomic) NSMutableArray *hourlyData;
@property (strong, nonatomic) NSArray *hourlyTime;
@property (strong, nonatomic) NSArray *hourlyDate;
@property (strong, nonatomic) NSArray *temperature;
@property (strong, nonatomic) NSArray *forecast;
@property (strong, nonatomic) NSArray *precipitation;
@property (strong, nonatomic) NSArray *icons;

@end
