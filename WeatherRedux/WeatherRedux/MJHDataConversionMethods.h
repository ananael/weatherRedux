//
//  MJHDataConversionMethods.h
//  weatherTryout
//
//  Created by Michael Hoffman on 9/17/14.
//  Copyright (c) 2014 Here We Go. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MJHDataConversionMethods : NSObject

-(NSString *) convertDecimalToRoundedString:(NSNumber *)number;
-(NSString *) convertToTemperature:(NSNumber *)number;
-(NSString *) convertToHiTemperature:(NSNumber *)number;
-(NSString *) convertToLoTemperature:(NSNumber *)number;
-(NSString *) convertToPercentage:(NSNumber *)number;
-(NSString *) convertToHumidityLabel:(NSNumber *)number;
-(NSString *) convertToPrecipProbability:(NSString *)precipType Probability:(NSNumber *)number;
-(NSString *) convertToWindDirection:(NSNumber *)number;
-(NSString *) convertToWind:(NSNumber *)number1 AndSpeed:(NSNumber *)number2;
-(NSString *) convertEpochTimeToHumanSunriseTime:(NSNumber *)number;
-(NSString *) convertEpochTimeToHumanSunsetTime:(NSNumber *)number;
-(NSString *) convertEpochTimeToHumanDate:(NSNumber *)number;
-(NSString *) convertEpochTimeToHumanDay:(NSNumber *)number;
-(NSString *) convertIntradayHiTemp:(NSNumber *)number1 LoTemp:(NSNumber *)number2;
-(void) setDayLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setHiLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setLoLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setHumidityLabelsFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setPrecipProbabilityFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setWindFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setVisibilityFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setForecastFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;
-(void) setDateFromArray:(NSArray *)array forDictionary:(NSMutableDictionary *)dictionary;

-(void) convertToVerticalText:(UILabel *)label;
-(void) convertToVerticalDayLabels:(NSArray *)array;
-(NSString *) convertToVisibilityLabel:(NSNumber *)number;

-(NSString *) summaryConversion:(NSString *)summary;
-(void) convertString:(NSString *)summary ForNowIconView:(UIImageView *)view;
-(void) convertString:(NSString *)summary ForDayIconView:(UIImageView *)view;
-(void) convertString:(NSString *)summary ForMainIconView:(UIImageView *)view;

-(NSMutableArray *) setHourlyDateFromDictionary:(NSMutableDictionary *)dictionary;
-(NSMutableArray *) setHourFromDictionary:(NSMutableDictionary *)dictionary;
-(NSMutableArray *) setHourlyTempFromDictionary:(NSMutableDictionary *)dictionary;
-(NSMutableArray *) setSummaryFromDictionary:(NSMutableDictionary *)dictionary;
-(NSMutableArray *) setHourlyPrecipFromDictionary:(NSMutableDictionary *)dictionary;
-(NSMutableArray *) setHourlyIconFromDictionary:(NSMutableDictionary *)dictionary;



@end
