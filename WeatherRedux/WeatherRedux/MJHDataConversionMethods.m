//
//  MJHDataConversionMethods.m
//  weatherTryout
//
//  Created by Michael Hoffman on 9/17/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import "MJHDataConversionMethods.h"

@implementation MJHDataConversionMethods

-(void) convertEpochTimeToHumanReadable:(NSTimeInterval)time
{
    NSDate *humanDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE: MMM dd, yy hh:mm a"];
    
    NSString *resultString = [formatter stringFromDate:humanDate];
    
    NSLog(@"Real Time: %@", resultString);
}

-(NSString *) convertDecimalToRoundedString:(NSNumber *)number
{
    CGFloat convertNumber = [number floatValue];
    NSString *roundedString = [NSString stringWithFormat:@"%.0f",convertNumber];
    
    return roundedString;
}

-(NSString *) convertToTemperature:(NSNumber *)number
{
    NSString *convertedNumber = [self convertDecimalToRoundedString:number];
    NSString *temperatureString = [NSString stringWithFormat:@"%@°", convertedNumber];
    return temperatureString;
}

-(NSString *) convertToHiTemperature:(NSNumber *)number
{
    NSString *convertedNumber = [self convertDecimalToRoundedString:number];
    NSString *temperatureString = [NSString stringWithFormat:@"hi: %@°", convertedNumber];
    return temperatureString;
}

-(NSString *) convertToLoTemperature:(NSNumber *)number
{
    NSString *convertedNumber = [self convertDecimalToRoundedString:number];
    NSString *temperatureString = [NSString stringWithFormat:@"lo: %@°", convertedNumber];
    return temperatureString;
}

-(NSString *) convertToPercentage:(NSNumber *)number
{
    CGFloat convertNumber = [number floatValue];
    NSString *percentageString = [NSString stringWithFormat:@"%.0f %%", (convertNumber*100)];
    
    return percentageString;
}

-(NSString *) convertToHumidityLabel:(NSNumber *)number
{
    CGFloat convertNumber = [number floatValue];
    NSString *humidityString = [NSString stringWithFormat:@"hum: %.0f%%", (convertNumber*100)];
    
    return humidityString;
}

-(NSString *) convertToPrecipProbability:(NSString *)precipType Probability:(NSNumber *)number
{
    CGFloat convertNumber = [number floatValue];
    if (precipType == nil)
    {
        NSString *precipString = [NSString stringWithFormat:@"0%% precipitation"];
        return precipString;
    }
    if ((convertNumber < 1.0f))
    {
        NSString *precipString = [NSString stringWithFormat:@"%@? %.0f%% chance", precipType, (convertNumber*100)];
        return precipString;
    }
    
    NSString *precipString = [NSString stringWithFormat:@"%@? 100%% chance", precipType];
    return precipString;
    
}

-(NSString *) convertToPrecipProbability2:(NSString *)precipType Probability:(NSNumber *)number
{
    CGFloat convertNumber = [number floatValue];
    if (precipType == nil)
    {
        NSString *precipString = [NSString stringWithFormat:@"no precipitation expected"];
        return precipString;
    }
    if ((convertNumber < 1.0f))
    {
        NSString *precipString = [NSString stringWithFormat:@"%.0f%% chance of %@", (convertNumber*100), precipType];
        return precipString;
    }
    
    NSString *precipString = [NSString stringWithFormat:@"bring an umbrella"];
    return precipString;
    
}

-(NSString *) convertToWind:(NSNumber *)number1 AndSpeed:(NSNumber *)number2
{
    NSString *windWithSpeed = [NSString stringWithFormat:@"wind: %@ %@ mph", [self convertToWindDirection:number1], [self convertDecimalToRoundedString:number2]];
    return windWithSpeed;
}

-(NSString *) convertEpochTimeToHumanSunriseTime:(NSNumber *)number
{
    NSInteger convertedNumber = [number integerValue];
    NSTimeInterval time = convertedNumber;
    NSDate *humanDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mma"];
    
    NSString *lowercaseSunriseFormat = [[formatter stringFromDate:humanDate] lowercaseStringWithLocale:[NSLocale currentLocale]];
    
    return lowercaseSunriseFormat;
}

-(NSString *) convertEpochTimeToHumanSunsetTime:(NSNumber *)number
{
    NSInteger convertedNumber = [number integerValue];
    NSTimeInterval time = convertedNumber;
    NSDate *humanDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mma"];
    
    NSString *lowercaseSunsetFormat = [[formatter stringFromDate:humanDate] lowercaseStringWithLocale:[NSLocale currentLocale]];
    
    return lowercaseSunsetFormat;
}

-(NSString *) convertEpochTimeToHumanDate:(NSNumber *)number
{
    NSInteger convertedNumber = [number integerValue];
    NSTimeInterval time = convertedNumber;
    NSDate *humanDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d"];
    
    NSString *lowercaseSunriseFormat = [[formatter stringFromDate:humanDate] lowercaseStringWithLocale:[NSLocale currentLocale]];
    
    return lowercaseSunriseFormat;
}

-(NSString *) convertEpochTimeToHumanDay:(NSNumber *)number
{
    NSInteger convertedNumber = [number integerValue];
    NSTimeInterval time = convertedNumber;
    NSDate *humanDate = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE"];
    
    NSString *lowercaseDayFormat = [[formatter stringFromDate:humanDate] lowercaseStringWithLocale:[NSLocale currentLocale]];
    
    return lowercaseDayFormat;
}

-(NSString *) convertIntradayHiTemp:(NSNumber *)number1 LoTemp:(NSNumber *)number2
{
    NSString *convertedNumber1 = [self convertDecimalToRoundedString:number1];
    NSString *convertedNumber2 = [self convertDecimalToRoundedString:number2];
    NSString *temperatureString = [NSString stringWithFormat:@"%@°/%@°", convertedNumber1, convertedNumber2];
    return temperatureString;
}

-(void) setDayLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *dayLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedDay = [self convertEpochTimeToHumanDay: dictionary[@"daily"][@"data"][i][@"time"]];
        label.text = convertedDay;
        label.font = [UIFont fontWithName:@"Thonburi" size:20];
        [label setFont:[UIFont boldSystemFontOfSize:20]];
        
        [dayLabels addObject:label];
    }
}

-(void) setHiLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *hiTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertDecimalToRoundedString: dictionary[@"daily"][@"data"][i][@"temperatureMax"]];
        NSString *hiString = [NSString stringWithFormat:@"hi: %@°", convertedNumber];
        label.text = hiString;
        
        [hiTempLabels addObject:label];
    }
}

-(void) setLoLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *loTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertDecimalToRoundedString: dictionary[@"daily"][@"data"][i][@"temperatureMin"]];
        NSString *loString = [NSString stringWithFormat:@"lo: %@°", convertedNumber];
        label.text = loString;
        
        [loTempLabels addObject:label];
    }
}

-(void) setHumidityLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *humidityTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertToHumidityLabel:dictionary[@"daily"][@"data"][i][@"humidity"]];
        label.text = convertedNumber;
        
        [humidityTempLabels addObject:label];
    }
}

-(void) setPrecipProbabilityFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *precipTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertToPrecipProbability:dictionary[@"daily"][@"data"][i][@"precipType"] Probability:dictionary[@"daily"][@"data"][i][@"precipProbability"]];
        label.text = convertedNumber;
        
        [precipTempLabels addObject:label];
    }
}

-(void) setWindFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *windTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertToWind:dictionary[@"daily"][@"data"][i][@"windBearing"] AndSpeed:dictionary[@"daily"][@"data"][i][@"windSpeed"]];
        label.text = convertedNumber;
        
        [windTempLabels addObject:label];
    }
}

-(void) setVisibilityFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *visibilityTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedNumber = [self convertToVisibilityLabel:dictionary[@"daily"][@"data"][i][@"visibility"]];
        label.text = convertedNumber;
        
        [visibilityTempLabels addObject:label];
    }
}

-(void) setForecastFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *forecastTempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        
        label.text = dictionary[@"daily"][@"data"][i][@"summary"];
        
        [forecastTempLabels addObject:label];
    }
}

-(void) setDateFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *dateLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [array count]; i++)
    {
        UILabel *label = array[i];
        NSString *convertedDate = [self convertEpochTimeToHumanDate: dictionary[@"daily"][@"data"][i][@"time"]];
        label.text = convertedDate;
        
        [dateLabels addObject:label];
    }
}

-(NSMutableArray *) setHourFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *hourLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *convertedDate = [self convertEpochTimeToHumanSunriseTime: dictionary[@"hourly"][@"data"][i][@"time"]];
        
        [hourLabels addObject:convertedDate];
    }
    return hourLabels;
}

-(NSMutableArray *) setHourlyDateFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *dateLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *convertedDate = [self convertEpochTimeToHumanDate: dictionary[@"hourly"][@"data"][i][@"time"]];
        
        [dateLabels addObject:convertedDate];
    }
    return dateLabels;
}

-(NSMutableArray *) setHourlyTempFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *tempLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *convertedTemp = [self convertToTemperature: dictionary[@"hourly"][@"data"][i][@"temperature"]];
        
        [tempLabels addObject:convertedTemp];
    }
    return tempLabels;
}

-(NSMutableArray *) setSummaryFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *summaryLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *summary = dictionary[@"hourly"][@"data"][i][@"summary"];
        NSString *lowercaseSummary = [summary lowercaseStringWithLocale:[NSLocale currentLocale]];
        
        [summaryLabels addObject:lowercaseSummary];
    }
    return summaryLabels;
}

-(NSMutableArray *) setHourlyPrecipFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *precipLabels = [NSMutableArray new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *convertedNumber = [self convertToPrecipProbability2:dictionary[@"hourly"][@"data"][i][@"precipType"] Probability:dictionary[@"hourly"][@"data"][i][@"precipProbability"]];
        
        [precipLabels addObject:convertedNumber];
    }
    return precipLabels;
}

-(NSMutableArray *) setHourlyIconFromDictionary:(NSMutableDictionary *)dictionary
{
    NSMutableArray *iconSummary = [NSMutableArray new];
    //    UIImageView *view = [UIImageView new];
    
    for (NSInteger i=0; i < [dictionary[@"hourly"][@"data"] count]; i++)
    {
        NSString *summary = dictionary[@"hourly"][@"data"][i][@"summary"];
        
        [iconSummary addObject:summary];
    }
    return iconSummary;
}

-(void) convertToVerticalText:(UILabel *)label
{
    label.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(M_PI_2*3), 1.25, 1.5);
    
}

-(void) convertToVerticalDayLabels:(NSArray *)array
{
    NSMutableArray *verticalLabels = [NSMutableArray new];
    for (UILabel *label in array)
    {
        [self convertToVerticalText:label];
        [verticalLabels addObject:label];
    }
}

-(NSString *) convertToVisibilityLabel:(NSNumber *)number
{
    if (number == nil) {
        NSString *visibilityString = [NSString stringWithFormat:@"visibility: no data"];
        return visibilityString;
    }
    NSString *visibilityString = [NSString stringWithFormat:@"visibility: %@ mi", [self convertDecimalToRoundedString:number]];
    return visibilityString;
}

-(NSString *) convertToWindDirection:(NSNumber *)number
{
    NSInteger convertedNumber = [number integerValue];
    NSString *direction;
    
    if ((convertedNumber >= 0) && (convertedNumber <= 11))
    {
        direction = @"N";
    } else if ((convertedNumber >= 12) && (convertedNumber <= 34))
    {
        direction = @"NNE";
    } else if ((convertedNumber >= 35) && (convertedNumber <= 57))
    {
        direction = @"NE";
    } else if ((convertedNumber >= 58) && (convertedNumber <= 79))
    {
        direction = @"ENE";
    } else if ((convertedNumber >= 80) && (convertedNumber <= 101))
    {
        direction = @"E";
    } else if ((convertedNumber >= 102) && (convertedNumber <= 124))
    {
        direction = @"ESE";
    } else if ((convertedNumber >= 125) && (convertedNumber <= 146))
    {
        direction = @"SE";
    } else if ((convertedNumber >= 147) && (convertedNumber <= 169))
    {
        direction = @"SSE";
    } else if ((convertedNumber >= 170) && (convertedNumber <= 191))
    {
        direction = @"S";
    } else if ((convertedNumber >= 192) && (convertedNumber <= 214))
    {
        direction = @"SSW";
    } else if ((convertedNumber >= 215) && (convertedNumber <= 236))
    {
        direction = @"SW";
    } else if ((convertedNumber >= 237) && (convertedNumber <= 259))
    {
        direction = @"WSW";
    } else if ((convertedNumber >= 260) && (convertedNumber <= 281))
    {
        direction = @"W";
    } else if ((convertedNumber >= 282) && (convertedNumber <= 304))
    {
        direction = @"WNW";
    } else if ((convertedNumber >= 305) && (convertedNumber <= 326))
    {
        direction = @"NW";
    } else if ((convertedNumber >= 327) && (convertedNumber <= 349))
    {
        direction = @"NNW";
    } else if ((convertedNumber >= 350) && (convertedNumber <= 360))
    {
        direction = @"N";
    }
    
    return direction;
}

-(NSString *) summaryConversion:(NSString *)summary
{
    if ([summary isEqualToString:@"Mostly Cloudy"])
    {
        summary = @"M. Cloudy";
    }
    else if ([summary isEqualToString:@"Partly Cloudy"])
    {
        summary = @"P. Cloudy";
    }
    else if ([summary isEqualToString:@"Heavy Rain"])
    {
        summary = @"Hvy Rain";
    }
    else if ([summary isEqualToString:@"Light Rain"])
    {
        summary = @"Lt Rain";
    }
    
    return summary;
}

-(void) convertString:(NSString *)summary ForHourlyIconView:(UIImageView *)view
{
    if ([summary isEqualToString:@"Clear"])
    {
        view.image = [UIImage imageNamed:@"sunny"];
    }
    else if ([summary isEqualToString:@"Partly Cloudy"])
    {
        view.image = [UIImage imageNamed:@"sun-cloud"];
    }
    else if ([summary isEqualToString:@"Mostly Cloudy"])
    {
        view.image = [UIImage imageNamed:@"MCloudy"];
    }
    else if ([summary isEqualToString:@"Overcast"])
    {
        view.image = [UIImage imageNamed:@"cloudy"];
    }
    else if ([summary isEqualToString:@"Light Rain"])
    {
        view.image = [UIImage imageNamed:@"light-rain"];
    }
    else if ([summary isEqualToString:@"Rain"])
    {
        view.image = [UIImage imageNamed:@"heavy-rain"];
    }
    else if ([summary isEqualToString:@"Drizzle"])
    {
        view.image = [UIImage imageNamed:@"light-rain"];
    }
}

-(void) convertString:(NSString *)summary ForNowIconView:(UIImageView *)view time1:(NSNumber *)current time2:(NSNumber *)sunrise time3:(NSNumber *)sunset
{
    NSInteger convert1 = [current integerValue];
    NSInteger convert2 = [sunrise integerValue];
    NSInteger convert3 = [sunset integerValue];
    
    if ((convert1 >= convert2) && (convert1 <= convert3))
    {
        if ([summary isEqualToString:@"Clear"])
        {
            view.image = [UIImage imageNamed:@"sunny"];
        }
        else if ([summary isEqualToString:@"Partly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"sun-cloud"];
        }
        else if ([summary isEqualToString:@"Mostly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"MCloudy"];
        }
        else if ([summary isEqualToString:@"Overcast"])
        {
            view.image = [UIImage imageNamed:@"cloudy"];
        }
        else if ([summary isEqualToString:@"Light Rain"])
        {
            view.image = [UIImage imageNamed:@"light-rain"];
        }
        else if ([summary isEqualToString:@"Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain"];
        }
        else if ([summary isEqualToString:@"Drizzle"])
        {
            view.image = [UIImage imageNamed:@"light-rain"];
        }
        else if ([summary isEqualToString:@"Heavy Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain"];
        }
    } else
    {
        if ([summary isEqualToString:@"Clear"])
        {
            view.image = [UIImage imageNamed:@"moon"];
        }
        else if ([summary isEqualToString:@"Partly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"moon-cloud"];
        }
        else if ([summary isEqualToString:@"Mostly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"moon-MCloudy"];
        }
        else if ([summary isEqualToString:@"Overcast"])
        {
            view.image = [UIImage imageNamed:@"cloudy"];
        }
        else if ([summary isEqualToString:@"Light Rain"])
        {
            view.image = [UIImage imageNamed:@"moon-rain"];
        }
        else if ([summary isEqualToString:@"Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain"];
        }
        else if ([summary isEqualToString:@"Drizzle"])
        {
            view.image = [UIImage imageNamed:@"moon-rain"];
        }
        else if ([summary isEqualToString:@"Heavy Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain"];
        }
    }
}

-(void) convertString:(NSString *)summary ForDayIconView:(UIImageView *)view
{
    if ([summary isEqualToString:@"clear-day"])
    {
        view.image = [UIImage imageNamed:@"sunny2"];
    }
    else if ([summary isEqualToString:@"partly-cloudy-day"])
    {
        view.image = [UIImage imageNamed:@"sun-cloud2"];
    }
    else if ([summary isEqualToString:@"partly-cloudy-night"])
    {
        view.image = [UIImage imageNamed:@"sun-cloud2"];
    }
    else if ([summary isEqualToString:@"cloudy"])
    {
        view.image = [UIImage imageNamed:@"cloudy2"];
    }
    else if ([summary isEqualToString:@"rain"])
    {
        view.image = [UIImage imageNamed:@"light-rain2"];
    }
    else if ([summary isEqualToString:@"thunderstorm"])
    {
        view.image = [UIImage imageNamed:@"thunderstorm2"];
    }
    else if ([summary isEqualToString:@"Drizzle"])
    {
        view.image = [UIImage imageNamed:@"light-rain2"];
    }
}

-(void) convertString:(NSString *)summary ForMainIconView:(UIImageView *)view time1:(NSNumber *)current time2:(NSNumber *)sunrise time3:(NSNumber *)sunset
{
    NSInteger convert1 = [current integerValue];
    NSInteger convert2 = [sunrise integerValue];
    NSInteger convert3 = [sunset integerValue];
    
    if ((convert1 >= convert2) && (convert1 < convert3))
    {
        if ([summary isEqualToString:@"Clear"])
        {
            view.image = [UIImage imageNamed:@"sunny3"];
        }
        else if ([summary isEqualToString:@"Partly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"sun-cloud3"];
        }
        else if ([summary isEqualToString:@"Mostly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"MCloudy3"];
        }
        else if ([summary isEqualToString:@"Overcast"])
        {
            view.image = [UIImage imageNamed:@"cloudy3"];
        }
        else if ([summary isEqualToString:@"Light Rain"])
        {
            view.image = [UIImage imageNamed:@"light-rain3"];
        }
        else if ([summary isEqualToString:@"Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain3"];
        }
        else if ([summary isEqualToString:@"Drizzle"])
        {
            view.image = [UIImage imageNamed:@"light-rain3"];
        }
        else if ([summary isEqualToString:@"Heavy Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain3"];
        }
    } else
    {
        if ([summary isEqualToString:@"Clear"])
        {
            view.image = [UIImage imageNamed:@"moon3"];
        }
        else if ([summary isEqualToString:@"Partly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"moon-cloud3"];
        }
        else if ([summary isEqualToString:@"Mostly Cloudy"])
        {
            view.image = [UIImage imageNamed:@"moon-MCloudy3"];
        }
        else if ([summary isEqualToString:@"Overcast"])
        {
            view.image = [UIImage imageNamed:@"cloudy3"];
        }
        else if ([summary isEqualToString:@"Light Rain"])
        {
            view.image = [UIImage imageNamed:@"moon-rain3"];
        }
        else if ([summary isEqualToString:@"Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain3"];
        }
        else if ([summary isEqualToString:@"Drizzle"])
        {
            view.image = [UIImage imageNamed:@"moon-rain3"];
        }
        else if ([summary isEqualToString:@"Heavy Rain"])
        {
            view.image = [UIImage imageNamed:@"heavy-rain3"];
        }
    }
}


@end
