//
//  NSTimerProxy.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/19.
//

#import "NSTimerProxy.h"

@implementation NSTimerProxy

+ (instancetype)initWithTarget:(id)target {
    
    NSTimerProxy *proxy = [super alloc];
    if (proxy) {
        
        proxy.target = target;
    }
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    [invocation invokeWithTarget:self.target];
}
@end
