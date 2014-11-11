//
//  MJHHourlyTableViewCell.h
//  weatherTryout
//
//  Created by Michael Hoffman on 9/29/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJHHourlyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@end
