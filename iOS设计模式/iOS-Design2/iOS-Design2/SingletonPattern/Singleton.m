//
//  Singleton.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype)sharedInstance {
    
    static Singleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[super allocWithZone:NULL]init];
    });
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
@end
