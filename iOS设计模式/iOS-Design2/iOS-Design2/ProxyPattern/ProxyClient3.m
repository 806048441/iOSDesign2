//
//  ProxyClient3.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import "ProxyClient3.h"
#import "NSTimerProxy.h"
#import "NSTimerProxy2.h"
@interface ProxyClient3 ()

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimerProxy *proxy1;
@property (strong, nonatomic) NSTimerProxy2 *proxy2;
@end

@implementation ProxyClient3

- (void)dealloc {
    
    NSLog(@"---%s----",__func__);
    if (_timer) {
        
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - custom

#pragma mark - privite
- (void)timerSel {
    
    NSLog(@"%s",__func__);
}
#pragma mark - public
- (void)test {
    
    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerSel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

- (void)test2 {
    
    self.proxy1 = [NSTimerProxy initWithTarget:self];
    _timer = [NSTimer timerWithTimeInterval:2 target:self.proxy1 selector:@selector(timerSel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}

- (void)test3 {
    
    self.proxy2 = [[NSTimerProxy2 alloc]initWithTarget:self];
    _timer = [NSTimer timerWithTimeInterval:2 target:self.proxy2 selector:@selector(timerSel) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}
@end
