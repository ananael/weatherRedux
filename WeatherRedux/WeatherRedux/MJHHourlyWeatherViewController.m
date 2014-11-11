//
//  MJHHourlyWeatherViewController.m
//  weatherTryout
//
//  Created by Michael Hoffman on 9/25/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import "MJHHourlyWeatherViewController.h"
#import "MJHHourlyTableViewCell.h"

@interface MJHHourlyWeatherViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UITableView *hourlyTable;

@property (weak, nonatomic) IBOutlet UIButton *backButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *homeButtonLabel;

- (IBAction)backButtonTapped:(id)sender;
- (IBAction)homeTapped:(id)sender;


@end

@implementation MJHHourlyWeatherViewController

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
    
    self.hourlyTable.delegate = self;
    self.hourlyTable.dataSource = self;
    self.hourlyTable.backgroundColor = [UIColor clearColor];
    [self.backButtonLabel setImage:[UIImage imageNamed:@"back-button-black"] forState:UIControlStateNormal];
    self.backButtonLabel.backgroundColor = [UIColor clearColor];
    [self.homeButtonLabel setImage:[UIImage imageNamed:@"home-black"] forState:UIControlStateNormal];
    self.homeButtonLabel.backgroundColor = [UIColor clearColor];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return 80;
    }
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.resultsDictionary[@"hourly"][@"data"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJHHourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    MJHDataConversionMethods *conversion = [MJHDataConversionMethods new];
    
    self.hourlyTime = [conversion setHourFromDictionary:self.resultsDictionary];
    cell.hourLabel.text = self.hourlyTime[indexPath.row];
    cell.hourLabel.textColor = [UIColor whiteColor];
    cell.hourLabel.backgroundColor = [UIColor clearColor];
    
    self.temperature = [conversion setHourlyTempFromDictionary:self.resultsDictionary];
    cell.temperatureLabel.text = self.temperature[indexPath.row];
    cell.temperatureLabel.backgroundColor = [UIColor clearColor];
    
    self.forecast = [conversion setSummaryFromDictionary:self.resultsDictionary];
    cell.summaryLabel.text = self.forecast[indexPath.row];
    cell.summaryLabel.backgroundColor = [UIColor clearColor];
    
    self.precipitation = [conversion setHourlyPrecipFromDictionary:self.resultsDictionary];
    cell.precipLabel.text = self.precipitation[indexPath.row];
    cell.precipLabel.textColor = [UIColor whiteColor];
    cell.precipLabel.backgroundColor = [UIColor clearColor];
    
    self.icons = [conversion setHourlyIconFromDictionary:self.resultsDictionary];
    [conversion convertString:self.icons[indexPath.row] ForNowIconView:cell.iconView];
    cell.iconView.backgroundColor = [UIColor clearColor];
    
    self.hourlyDate = [conversion setHourlyDateFromDictionary:self.resultsDictionary];
    cell.dateLabel.text = self.hourlyDate[indexPath.row];
    cell.dateLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
}
*/

- (IBAction)backButtonTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeTapped:(id)sender
{
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
}

@end
