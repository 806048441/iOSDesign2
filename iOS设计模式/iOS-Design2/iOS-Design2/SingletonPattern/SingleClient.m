//
//  SingleClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "SingleClient.h"
#import "Singleton.h"
@implementation SingleClient

+ (void)test {
    
    [Singleton sharedInstance].userName = @"GG";
    
    [Singleton new].userName = @"KK";
    
    NSLog(@"###%@=[Singleton defaultManager].userName###",[Singleton sharedInstance].userName);
}
@end
