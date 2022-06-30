//
//  SimpleFactoryClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "SimpleFactoryClient.h"

//第一步时的手机类
//@interface IPhone : NSObject
//@end
//
//@implementation IPhone
//@end
//
//@interface XMPhone : NSObject
//@end
//
//@implementation XMPhone
//@end
//
//@interface HWPhone : NSObject
//@end
//
//@implementation HWPhone
//@end

@interface Phone : NSObject
- (void)showName;
@end

@implementation Phone
- (void)showName {
    
}
@end

@interface IPhone : Phone
@end

@implementation IPhone
- (void)showName {
    NSLog(@"苹果手机");
}
@end

@interface XMPhone : Phone
@end

@implementation XMPhone
- (void)showName {
    NSLog(@"小米手机");
}
@end

@interface HWPhone : Phone
@end

@implementation HWPhone
- (void)showName {
    NSLog(@"华为手机");
}
@end

@interface PhoneFactroy : NSObject
@end

@implementation PhoneFactroy
+ (Phone *)outputPhone:(NSInteger)style {
    if (style == 1) {
        return [IPhone new];
    } else if (style == 2) {
        return [XMPhone new];
    } else if (style == 3) {
        return [HWPhone new];
    }
    return nil;
}
@end

@interface JDQJCorp : NSObject

@end

@implementation JDQJCorp
- (void)salePhone:(NSObject *)phone {
    NSLog(@"###%s###",__func__);
}
@end

@implementation SimpleFactoryClient

//第一步 模拟京东618 出手机的场景 顾客传1 卖出去iphone 顾客传2 卖出去小米phone 顾客传3 卖出去华为phone
+ (void)test1 {
    
    //代码实现是这样的
    NSInteger customStyle = 1+arc4random()%3;
    JDQJCorp *jdCorp = [JDQJCorp new];
    if (customStyle == 1) {
        
        IPhone *phone = [IPhone new];
        [jdCorp salePhone:phone];
        [phone showName];
    } else if (customStyle == 2) {
        
        XMPhone *phone = [XMPhone new];
        [jdCorp salePhone:phone];
        [phone showName];
    } else if (customStyle == 3) {
        
        HWPhone *phone = [HWPhone new];
        [jdCorp salePhone:phone];
        [phone showName];
    }
    
}

+ (void)test2 {
    
    //第二步 简单工厂实现一下子 一个工厂类 多个产品类 一样是jd卖手机，这一步让几种手机继承与Phone这个父类
    //代码是这样实现的
    //这种和第一步 优点是：加了一个手机工厂，JD商家和各类手机解耦，不必再引用各种手机类，手机类型的判断到了工厂类里 缺点是：手机工厂与各个手机类耦合，并没有从根本解决问题，并且还是一定程度违背开闭原则，拓展的话依然要去更改简单工厂类。
    //这种做法最重要的是解决 拓展类似于天猫、拼多多也卖手机的问题。这种问题用这种方式是能完美解决的。
    NSInteger customStyle = 1+arc4random()%3;
    JDQJCorp *jdCorp = [JDQJCorp new];
    Phone *phone = [PhoneFactroy outputPhone:customStyle];
    [jdCorp salePhone:phone];
    [phone showName];
}
@end
