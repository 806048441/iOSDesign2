//
//  NSTimerProtocol.h
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NSTimerProtocol <NSObject>

@optional
- (void)timerSel;
- (void)timerSel:(id)data;
@end

NS_ASSUME_NONNULL_END
