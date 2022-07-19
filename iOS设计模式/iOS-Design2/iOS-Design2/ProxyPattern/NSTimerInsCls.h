//
//  NSTimerInsCls.h
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import <Foundation/Foundation.h>
#import "NSTimerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSTimerInsCls : NSObject<NSTimerProtocol>

@property (weak, nonatomic) id <NSTimerProtocol>target;
- (instancetype)initWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
