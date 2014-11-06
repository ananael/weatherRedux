//
//  ViewController.h
//  WeatherRedux
//
//  Created by Michael Hoffman on 10/26/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Forecastr.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) Forecastr *forecastr;
@property (strong, nonatomic) NSMutableDictionary *resultsDictionary;

@end

