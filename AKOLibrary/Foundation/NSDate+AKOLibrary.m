//
//  NSDate+AKOLibrary.m
//  AKOLibrary
//
//  Created by Adrian on 4/15/11.
//  Copyright (c) 2009, 2010, 2011, Adrian Kosmaczewski & akosma software
//  All rights reserved.
//  
//  Use in source and/or binary forms without modification is permitted following the
//  instructions in the LICENSE file.
//  
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
//  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
//  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
//  OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "NSDate+AKOLibrary.h"
#import "AKOPreferencesManager.h"
#import "AKOLibrary_Foundation_functions.h"

@implementation NSDate(AKOLibrary)

+ (NSDate *)ako_randomDateBetween1970AndNow
{
    NSTimeInterval interval = arc4random() % (u_int32_t)[[NSDate date] timeIntervalSince1970];
    return [NSDate dateWithTimeIntervalSince1970:interval];
}

+ (NSDate *)ako_randomDateBetween2001AndNow
{
    NSTimeInterval interval = arc4random() % (u_int32_t)[NSDate timeIntervalSinceReferenceDate];
    return [NSDate dateWithTimeIntervalSinceReferenceDate:interval];
}

- (NSString *)ako_dateString
{
    NSString *language = [AKOPreferencesManager sharedAKOPreferencesManager].language;
    NSLocale *locale = [[[NSLocale alloc] initWithLocaleIdentifier:language] autorelease];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setLocale:locale];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)ako_dateTimeString
{
    NSString *language = [AKOPreferencesManager sharedAKOPreferencesManager].language;
    NSLocale *locale = [[[NSLocale alloc] initWithLocaleIdentifier:language] autorelease];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setLocale:locale];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)ako_weekday
{
    // Adapted from
    // http://stackoverflow.com/questions/583692/how-to-check-what-day-of-the-week-it-is-i-e-tues-fri-and-compare-two-nsdates
    
    // Sunday = 1, Saturday = 7
    NSInteger day = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
    NSString *key = [NSString stringWithFormat:@"WEEKDAY_%d", day];
    return AKOLocalizedString(key, @"The day of the week in the current language");
}

@end
