//
//  MJHDailyWeatherViewController.m
//  weatherTryout
//
//  Created by Michael Hoffman on 9/16/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import "MJHDailyWeatherViewController.h"
#import "MJHDataConversionMethods.h"
//#import "MJHHourlyWeatherViewController.h"

@interface MJHDailyWeatherViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UILabel *nowLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowHumidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowPrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowWindLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowVisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *nowIconImage;
@property (weak, nonatomic) IBOutlet UILabel *nowDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *day1Label;
@property (weak, nonatomic) IBOutlet UILabel *day1DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1HiLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1LoLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1PrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1WindLabel;
@property (weak, nonatomic) IBOutlet UILabel *day1VisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *day1IconImage;
@property (weak, nonatomic) IBOutlet UILabel *day1DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *day2Label;
@property (weak, nonatomic) IBOutlet UILabel *day2DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2HiLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2LoLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2PrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2WindLabel;
@property (weak, nonatomic) IBOutlet UILabel *day2VisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *day2IconImage;
@property (weak, nonatomic) IBOutlet UILabel *day2DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *day3Label;
@property (weak, nonatomic) IBOutlet UILabel *day3DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3HiLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3LoLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3PrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3WindLabel;
@property (weak, nonatomic) IBOutlet UILabel *day3VisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *day3IconImage;
@property (weak, nonatomic) IBOutlet UILabel *day3DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *day4Label;
@property (weak, nonatomic) IBOutlet UILabel *day4DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4HiLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4LoLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4PrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4WindLabel;
@property (weak, nonatomic) IBOutlet UILabel *day4VisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *day4IconImage;
@property (weak, nonatomic) IBOutlet UILabel *day4DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *day5Label;
@property (weak, nonatomic) IBOutlet UILabel *day5DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5HiLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5LoLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5PrecipLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5WindLabel;
@property (weak, nonatomic) IBOutlet UILabel *day5VisibilityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *day5IconImage;
@property (weak, nonatomic) IBOutlet UILabel *day5DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *fake1Label;

@property (weak, nonatomic) IBOutlet UIButton *backButtonlabel;
@property (weak, nonatomic) IBOutlet UIButton *hourlyButtonLabel;


- (IBAction)backButtonTapped:(id)sender;
- (IBAction)hourlyTapped:(id)sender;



@end

@implementation MJHDailyWeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.backgroundImage.image = [UIImage imageNamed:@"Earth inverted"];
    [self.backButtonlabel setImage:[UIImage imageNamed:@"back-button-black"] forState:UIControlStateNormal];
    [self.hourlyButtonLabel setImage:[UIImage imageNamed:@"hourly-black"] forState:UIControlStateNormal];
    self.hourlyButtonLabel.backgroundColor = [UIColor clearColor];
    self.conversion = [MJHDataConversionMethods new];
    
    [self.conversion convertToVerticalDayLabels:[self dayLabels]];
    
    self.nowLabel.text = @"now";
    self.nowLabel.font = [UIFont fontWithName:@"Thonburi" size:20];
    [self.nowLabel setFont:[UIFont boldSystemFontOfSize:20]];
    self.nowTempLabel.text = [self.conversion convertToTemperature:self.resultsDictionary[@"currently"][@"temperature"]];
    self.nowDescriptionLabel.text = self.resultsDictionary[@"hourly"][@"summary"];
    self.nowHumidityLabel.text = [self.conversion convertToHumidityLabel:self.resultsDictionary[@"currently"][@"humidity"]];
    self.nowPrecipLabel.text = [self.conversion convertToPrecipProbability:self.resultsDictionary[@"currently"][@"precipType"] Probability:self.resultsDictionary[@"currently"][@"precipProbability"]];
    self.nowWindLabel.text = [self.conversion convertToWind:self.resultsDictionary[@"currently"][@"windBearing"] AndSpeed:self.resultsDictionary[@"currently"][@"windSpeed"]];
    self.nowVisibilityLabel.text = [self.conversion convertToVisibilityLabel:self.resultsDictionary[@"currently"][@"visibility"]];
    [self.conversion convertString:self.resultsDictionary[@"currently"][@"summary"] ForNowIconView:self.nowIconImage];
    self.nowDateLabel.text = [self.conversion convertEpochTimeToHumanDate:self.resultsDictionary[@"currently"][@"time"]];

    [self.conversion setDayLabelsFromArray:[self dayLabels2] forDictionary:self.resultsDictionary];
    [self.conversion setHiLabelsFromArray:[self hiLabels] forDictionary:self.resultsDictionary];
    [self.conversion setLoLabelsFromArray:[self loLabels] forDictionary:self.resultsDictionary];
    [self.conversion setHumidityLabelsFromArray:[self humidityLabels] forDictionary:self.resultsDictionary];
    [self.conversion setPrecipProbabilityFromArray:[self precipLabels] forDictionary:self.resultsDictionary];
    [self.conversion setWindFromArray:[self windLabels] forDictionary:self.resultsDictionary];
    [self.conversion setVisibilityFromArray:[self visibilityLabels] forDictionary:self.resultsDictionary];
    [self.conversion setForecastFromArray:[self forecastLabels] forDictionary:self.resultsDictionary];
    [self.conversion setDateFromArray:[self dateLabels] forDictionary:self.resultsDictionary];
    
    [self.conversion convertString:self.resultsDictionary[@"daily"][@"data"][1][@"icon"] ForDayIconView:self.day1IconImage];
    [self.conversion convertString:self.resultsDictionary[@"daily"][@"data"][2][@"icon"] ForDayIconView:self.day2IconImage];
    [self.conversion convertString:self.resultsDictionary[@"daily"][@"data"][3][@"icon"] ForDayIconView:self.day3IconImage];
    [self.conversion convertString:self.resultsDictionary[@"daily"][@"data"][4][@"icon"] ForDayIconView:self.day4IconImage];
    [self.conversion convertString:self.resultsDictionary[@"daily"][@"data"][5][@"icon"] ForDayIconView:self.day5IconImage];
    
}

-(NSArray *)dayLabels
{
    NSArray *dayLabels = @[self.nowLabel, self.day1Label, self.day2Label, self.day3Label, self.day4Label, self.day5Label];
    return dayLabels;
}

-(NSArray *)dayLabels2
{
    NSArray *dayLabels = @[self.fake1Label, self.day1Label, self.day2Label, self.day3Label, self.day4Label, self.day5Label];
    return dayLabels;
}

-(NSArray *)hiLabels
{
    NSArray *hiLabels = @[self.fake1Label, self.day1HiLabel, self.day2HiLabel, self.day3HiLabel, self.day4HiLabel, self.day5HiLabel];
    return hiLabels;
}

-(NSArray *)loLabels
{
    NSArray *loLabels = @[self.fake1Label, self.day1LoLabel, self.day2LoLabel, self.day3LoLabel, self.day4LoLabel, self.day5LoLabel];
    return loLabels;
}

-(NSArray *)humidityLabels
{
    NSArray *humLabels = @[self.fake1Label, self.day1humidityLabel, self.day2humidityLabel, self.day3humidityLabel, self.day4humidityLabel, self.day5humidityLabel];
    return humLabels;
}

-(NSArray *)precipLabels
{
    NSArray *precipLabels = @[self.fake1Label, self.day1PrecipLabel, self.day2PrecipLabel, self.day3PrecipLabel, self.day4PrecipLabel, self.day5PrecipLabel];
    return precipLabels;
}

-(NSArray *)windLabels
{
    NSArray *windLabels = @[self.fake1Label, self.day1WindLabel, self.day2WindLabel, self.day3WindLabel, self.day4WindLabel, self.day5WindLabel];
    return windLabels;
}

-(NSArray *) visibilityLabels
{
    NSArray *visibilityLabels = @[self.fake1Label, self.day1VisibilityLabel, self.day2VisibilityLabel, self.day3VisibilityLabel, self.day4VisibilityLabel, self.day5VisibilityLabel];
    return visibilityLabels;
}

-(NSArray *) forecastLabels
{
    NSArray *forecastLabels = @[self.fake1Label, self.day1DescriptionLabel, self.day2DescriptionLabel, self.day3DescriptionLabel, self.day4DescriptionLabel, self.day5DescriptionLabel];
    return forecastLabels;
}

-(NSArray *) dateLabels
{
    NSArray *dateLabels = @[self.fake1Label, self.day1DateLabel, self.day2DateLabel, self.day3DateLabel, self.day4DateLabel, self.day5DateLabel];
    return dateLabels;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([segue.identifier isEqualToString:@"hourlySegue"]) {
//        MJHHourlyWeatherViewController *hourlyVC = segue.destinationViewController;
//        hourlyVC.resultsDictionary = self.resultsDictionary;
//    }
//    
//}

- (IBAction)backButtonTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)hourlyTapped:(id)sender
{
    [self performSegueWithIdentifier:@"hourlySegue" sender:self];
}
@end




