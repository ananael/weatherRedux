//
//  ViewController.m
//  WeatherRedux
//
//  Created by Michael Hoffman on 10/26/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import "ViewController.h"
#import <Forecastr.h>
#import "MJHDataConversionMethods.h"
#import "MJHDailyWeatherViewController.h"
#import "MJHConstants.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *centralContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *centralThemeImage;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *weatherIconLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *feelsLikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *feelsTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunsetTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1Label;
@property (weak, nonatomic) IBOutlet UILabel *day2Label;
@property (weak, nonatomic) IBOutlet UILabel *day3Label;
@property (weak, nonatomic) IBOutlet UILabel *day4Label;
@property (weak, nonatomic) IBOutlet UILabel *day5Label;
@property (weak, nonatomic) IBOutlet UILabel *day1TempLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2TempLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3TempLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4TempLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5TempLabel;

@property (weak, nonatomic) IBOutlet UIButton *nextButtonLabel;
- (IBAction)nextButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *buttonContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBarHidden = YES;
    self.backgroundImage.image = [UIImage imageNamed:@"Earth 2"];
    [self.nextButtonLabel setImage:[UIImage imageNamed:@"next-button-white"] forState:UIControlStateNormal];
    self.nextButtonLabel.backgroundColor = [UIColor clearColor];
    
    MJHDataConversionMethods *conversion = [MJHDataConversionMethods new];
    
    self.forecastr =[Forecastr sharedManager];
    self.forecastr.apiKey = FORECAST_API_KEY;
    
    [self.forecastr getForecastForLatitude:+40.75170
                                 longitude:-73.99420
                                      time:nil
                                exclusions:nil
                                    extend:nil
                                   success:^(id JSON)
     {
         self.resultsDictionary = JSON;
         
         [conversion convertString:self.resultsDictionary[@"currently"][@"summary"] ForMainIconView:self.weatherIcon];
         self.weatherIconLabel.text = [conversion summaryConversion:self.resultsDictionary[@"currently"][@"summary"]];
         self.highTempLabel.text = [conversion convertToHiTemperature:self.resultsDictionary[@"daily"][@"data"][0][@"apparentTemperatureMax"]];
         self.lowTempLabel.text = [conversion convertToLoTemperature:self.resultsDictionary[@"daily"][@"data"][0][@"apparentTemperatureMin"]];
         self.currentTempLabel.text = [conversion convertToTemperature:self.resultsDictionary[@"currently"][@"temperature"]];
         self.currentTempLabel.textColor = [UIColor colorWithRed:92.0/255 green:108.0/255 blue:135.0/255 alpha:1.0];
         self.feelsLikeLabel.textColor = [UIColor colorWithRed:92.0/255 green:108.0/255 blue:135.0/255 alpha:1.0];
         self.feelsTempLabel.text = [conversion convertToTemperature:self.resultsDictionary[@"currently"][@"apparentTemperature"]];
         self.feelsTempLabel.textColor = [UIColor colorWithRed:92.0/255 green:108.0/255 blue:135.0/255 alpha:1.0];
         self.humidityPercentLabel.text = [conversion convertToPercentage:self.resultsDictionary[@"currently"][@"humidity"]];
         self.windDirectionLabel.text = [conversion convertToWindDirection:self.resultsDictionary[@"currently"][@"windBearing"]];
         self.windSpeedLabel.text = [conversion convertDecimalToRoundedString:self.resultsDictionary[@"currently"][@"windSpeed"]];
         self.sunriseTimeLabel.text = [conversion convertEpochTimeToHumanSunriseTime:self.resultsDictionary[@"daily"][@"data"][0][@"sunriseTime"]];
         self.sunsetTimeLabel.text = [conversion convertEpochTimeToHumanSunsetTime:self.resultsDictionary[@"daily"][@"data"][0][@"sunsetTime"]];
         self.day1Label.text = [conversion convertEpochTimeToHumanDay:self.resultsDictionary[@"daily"][@"data"][1][@"time"]];
         self.day2Label.text = [conversion convertEpochTimeToHumanDay:self.resultsDictionary[@"daily"][@"data"][2][@"time"]];
         self.day3Label.text = [conversion convertEpochTimeToHumanDay:self.resultsDictionary[@"daily"][@"data"][3][@"time"]];
         self.day4Label.text = [conversion convertEpochTimeToHumanDay:self.resultsDictionary[@"daily"][@"data"][4][@"time"]];
         self.day5Label.text = [conversion convertEpochTimeToHumanDay:self.resultsDictionary[@"daily"][@"data"][5][@"time"]];
         self.day1TempLabel.text = [conversion convertIntradayHiTemp:self.resultsDictionary[@"daily"][@"data"][1][@"temperatureMax"] LoTemp:self.resultsDictionary[@"daily"][@"data"][1][@"temperatureMin"]];
         self.day2TempLabel.text = [conversion convertIntradayHiTemp:self.resultsDictionary[@"daily"][@"data"][2][@"temperatureMax"] LoTemp:self.resultsDictionary[@"daily"][@"data"][2][@"temperatureMin"]];
         self.day3TempLabel.text = [conversion convertIntradayHiTemp:self.resultsDictionary[@"daily"][@"data"][3][@"temperatureMax"] LoTemp:self.resultsDictionary[@"daily"][@"data"][3][@"temperatureMin"]];
         self.day4TempLabel.text = [conversion convertIntradayHiTemp:self.resultsDictionary[@"daily"][@"data"][4][@"temperatureMax"] LoTemp:self.resultsDictionary[@"daily"][@"data"][4][@"temperatureMin"]];
         self.day5TempLabel.text = [conversion convertIntradayHiTemp:self.resultsDictionary[@"daily"][@"data"][5][@"temperatureMax"] LoTemp:self.resultsDictionary[@"daily"][@"data"][5][@"temperatureMin"]];
         
         
         NSLog(@"Temp: %@ \n Today: %@", self.resultsDictionary[@"currently"], self.resultsDictionary[@"daily"][@"data"]);
     }
                                   failure:^(NSError *error, id response) {
                                       NSLog(@"Error while retrieving forecast: %@", [self.forecastr messageForError:error withResponse:response]);
                                   }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    NSLog(@"Adjacent Container: X: %f  Y:%f",self.bottomContainer.frame.origin.x, self.bottomContainer.frame.origin.y);
    NSLog(@"Container: X: %f  Y:%f",self.buttonContainer.frame.origin.x, self.buttonContainer.frame.origin.y);
    NSLog(@"Button: X: %f  Y:%f",self.nextButtonLabel.frame.origin.x, self.nextButtonLabel.frame.origin.y);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"dailySegue"]) {
        MJHDailyWeatherViewController *dailyVC = segue.destinationViewController;
        dailyVC.resultsDictionary = self.resultsDictionary;
    }
}

- (IBAction)nextButtonTapped:(id)sender
{
    [self performSegueWithIdentifier:@"dailySegue" sender:self];
}


@end
