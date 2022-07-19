//
//  NSTimerInsCls.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import "NSTimerInsCls.h"

@implementation NSTimerInsCls

- (instancetype)initWithTarget:(id)target {
    
    self = [super init];
    if (self) {
        
        self.target = target;
    }
    return self;
}

- (void)timerSel {
    
    NSLog(@"%s",__func__);
    if ([self.target respondsToSelector:@selector(timerSel)]) {
        
        [self.target timerSel];
    }
}

- (void)timerSel:(id)data {
    
    NSLog(@"%s",__func__);
    if ([self.target respondsToSelector:@selector(timerSel:)]) {
        
        [self.target timerSel:data];
    } else {
        
        NSLog(@"被代理者没有实现对应方法");
    }
}
@end
