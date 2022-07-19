//
//  Singleton.h
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property (copy, nonatomic) NSString *userName;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
