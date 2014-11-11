//
//  MJHDailyWeatherViewController.h
//  weatherTryout
//
//  Created by Michael Hoffman on 9/16/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJHDataConversionMethods.h"
#import "ViewController.h"

@interface MJHDailyWeatherViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *resultsDictionary;
@property (strong, nonatomic) MJHDataConversionMethods *conversion;


@end
