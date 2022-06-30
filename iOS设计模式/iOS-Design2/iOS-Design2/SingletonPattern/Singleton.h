//
//  Singleton.h
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

+ (instancetype)sharedInstance;

@property (copy, nonatomic) NSString *userName;
@end

NS_ASSUME_NONNULL_END
