//
//  TimeFormatter.m
//  ListenAndRepeat
//
//  Created by Jinhyuk Kim on 2015. 11. 28..
//  Copyright © 2015년 Jinhyuk Kim. All rights reserved.
//

#import "TimeFormatter.h"

@implementation TimeFormatter

- (NSString *)stringForObjectValue:(id)obj {
    if (![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", [obj integerValue] / 3600, ([obj integerValue] / 60) % 60, [obj integerValue] % 60];
}

- (BOOL)getObjectValue:(out __autoreleasing id  _Nullable *)obj forString:(NSString *)string errorDescription:(out NSString * _Nullable __autoreleasing *)error {
    return YES;
}

@end
