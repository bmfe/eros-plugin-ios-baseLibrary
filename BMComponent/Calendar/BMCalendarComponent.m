//
//  BMCalendarComponent.m
//  BM-Doctor
//
//  Created by 窦静轩 on 2017/5/12.
//  Copyright © 2017年 窦静轩. All rights reserved.
//

#import "BMCalendarComponent.h"
#import <FSCalendar/FSCalendar.h>

static NSString * defaultDateFormat = @"yyyy-MM-dd";


@interface BMCalendarComponent()<FSCalendarDataSource,FSCalendarDelegate>


@property (weak, nonatomic) FSCalendar *calendar;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (copy, nonatomic) NSString * minimumDate;
@property (copy, nonatomic) NSString * maximumDate;
@property (strong, nonatomic) NSDictionary<NSString *, UIImage *> *images;

@end


@implementation BMCalendarComponent

WX_EXPORT_METHOD(@selector(goBack))
WX_EXPORT_METHOD(@selector(done:))
WX_EXPORT_METHOD(@selector(goForward))

-(instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        
        self.maximumDate = attributes[@"maximumDate"];
        self.minimumDate = attributes[@"minimumDate"];
        
        [self startCalendar:attributes];
    }

    return self;
}

-(UIView*)loadView
{
    FSCalendar *calendar = [[FSCalendar alloc] init];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = defaultDateFormat;

    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.scrollDirection = FSCalendarScrollDirectionVertical;
    calendar.backgroundColor = [UIColor whiteColor];
    
    self.calendar = calendar;

    
    
    return calendar;
}

-(void)startCalendar:(NSDictionary*)attributes
{
    if (attributes[@"dateFormat"]) {
        self.dateFormatter.dateFormat = attributes[@"dateFormat"];
    }
}

#pragma mark - <FSCalendarDelegate>

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"should select date %@",[self.dateFormatter stringFromDate:date]);
    return YES;
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter stringFromDate:date]);
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
}

- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    NSLog(@"did change to page %@",[self.dateFormatter stringFromDate:calendar.currentPage]);
}

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    calendar.frame = (CGRect){calendar.frame.origin,bounds.size};
}

#pragma mark - <FSCalendarDataSource>


- (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar
{
    return [self.dateFormatter dateFromString:self.minimumDate];
}

- (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar
{
    return [self.dateFormatter dateFromString:self.maximumDate];
}


- (UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date
{
    NSString *dateString = [self.dateFormatter stringFromDate:date];
    return self.images[dateString];
}

#pragma mark 前端透传事件
-(void)goBack
{
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *prevMonth = [gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:self.calendar.currentPage options:0];
    [self.calendar setCurrentPage:prevMonth animated:YES];

}
-(void)goForward
{
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *nextMonth = [gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:self.calendar.currentPage options:0];
    [self.calendar setCurrentPage:nextMonth animated:YES];

}
-(void)done:(WXModuleCallback)callback
{
    if (callback) {
        NSString * selectDateString = nil;
        if(self.calendar.selectedDate){
          selectDateString = [self.dateFormatter stringFromDate:self.calendar.selectedDate];
        }
        else{
            selectDateString = [self.dateFormatter stringFromDate:self.calendar.today];
        }
        
        if (selectDateString) {
            NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:selectDateString,@"selectDate",nil];
            callback(dict);
        }
    }
}
@end
