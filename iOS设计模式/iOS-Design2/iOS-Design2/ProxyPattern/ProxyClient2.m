//
//  ProxyClient2.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import "ProxyClient2.h"
#import "NSTimerInsCls.h"

@interface ProxyClient2 ()<NSTimerProtocol>

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSTimer *timer2;
@property (strong, nonatomic) NSTimerInsCls *ins;
@property (strong, nonatomic) NSTimerInsCls *ins2;
@end


@implementation ProxyClient2
- (void)dealloc {
    
    NSLog(@"---%s----",__func__);
    if (_timer) {
        
        [_timer invalidate];
        _timer = nil;
    }
    
    if (_timer2) {
        
        [_timer2 invalidate];
        _timer2 = nil;
    }
}
#pragma mark - custom

- (NSTimer *)timer {
    
    if (!_timer) {
        
        self.ins = [[NSTimerInsCls alloc]initWithTarget:self];
        _timer = [NSTimer timerWithTimeInterval:2 target:self.ins selector:@selector(timerSel) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (NSTimer *)timer2 {
    
    if (!_timer2) {
        
        self.ins2 = [[NSTimerInsCls alloc]initWithTarget:self];
        _timer2 = [NSTimer timerWithTimeInterval:2 target:self.ins selector:@selector(timerSel:) userInfo:@"data" repeats:YES];
    }
    return _timer2;
}

#pragma mark - public
- (void)test {
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] addTimer:self.timer2 forMode:NSRunLoopCommonModes];
    [self.timer fire];
    [self.timer2 fire];
}

#pragma mark - protocol
- (void)timerSel {
    
    NSLog(@"%s",__func__);
}

@end
