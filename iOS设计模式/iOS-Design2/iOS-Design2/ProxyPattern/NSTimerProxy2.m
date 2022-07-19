//
//  NSTimerProxy2.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import "NSTimerProxy2.h"

@implementation NSTimerProxy2

- (instancetype)initWithTarget:(id)target {
    
    self = [super init];
    if (self) {
        
        self.target = target;
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    return self.target;
}
@end
