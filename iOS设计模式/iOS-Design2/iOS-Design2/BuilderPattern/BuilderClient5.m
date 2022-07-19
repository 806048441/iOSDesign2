//
//  BuilderClient5.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/12.
//

#import "BuilderClient5.h"
#import <UIKit/UIKit.h>
@class BuilderClient4Config;
typedef BuilderClient4Config *(^configString)(NSString *string);
typedef BuilderClient4Config *(^configTextField)(UITextField *textField);
typedef BuilderClient4Config *(^configLabel)(UILabel *label);
typedef BuilderClient4Config *(^configView)(UIView *view);
typedef BuilderClient4Config *(^configFloat)(CGFloat value);

@interface BuilderClient4Config : NSObject

@end

@implementation BuilderClient4Config

- (configTextField)te {
    
    return nil;
}

@end


@implementation BuilderClient5

- (void)test {
    [BuilderClient4Config new].te(@"");
}

@end
