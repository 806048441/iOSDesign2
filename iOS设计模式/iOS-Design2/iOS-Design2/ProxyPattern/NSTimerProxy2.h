//
//  NSTimerProxy2.h
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimerProxy2 : NSObject

@property (weak, nonatomic) id target;
- (instancetype)initWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
