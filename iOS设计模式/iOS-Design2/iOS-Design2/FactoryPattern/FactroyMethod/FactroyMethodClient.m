//
//  FactroyMethodClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "FactroyMethodClient.h"

@interface Phone2 : NSObject
- (void)showName;
@end

@implementation Phone2
- (void)showName {
    
}
@end

@interface IPhone2 : Phone2
@end

@implementation IPhone2
- (void)showName {
    NSLog(@"苹果手机");
}
@end

@interface XMPhone2 : Phone2
@end

@implementation XMPhone2
- (void)showName {
    NSLog(@"小米手机");
}
@end

@interface HWPhone2 : Phone2
@end

@implementation HWPhone2

- (void)showName {
    NSLog(@"华为手机");
}
@end

@protocol PhoneFactroy2 <NSObject>
- (Phone2 *)outputPhone;
@end

@interface IPhoneFactroy2 : NSObject<PhoneFactroy2>
@end

@implementation IPhoneFactroy2
- (Phone2 *)outputPhone {
    return [IPhone2 new];
}
@end

@interface XMPhoneFactroy2 : NSObject<PhoneFactroy2>
@end

@implementation XMPhoneFactroy2
- (Phone2 *)outputPhone {
    return [XMPhone2 new];
}
@end

@interface HWPhoneFactroy2 : NSObject<PhoneFactroy2>
@end

@implementation HWPhoneFactroy2
- (Phone2 *)outputPhone {
    return [HWPhone2 new];
}
@end


@interface JDQJCorp2 : NSObject

@end

@implementation JDQJCorp2
- (void)salePhone:(NSObject *)phone {
    NSLog(@"###%s###",__func__);
}
@end

@interface FactroyMethodClient ()

@end

@implementation FactroyMethodClient

+ (void)test {
    
    //工厂方法模式 优点： 用户只需要知道具体工厂的名称就可得到所要的产品，无须知道产品的具体创建过程；在系统增加新的产品时只需要添加具体产品类和对应的具体工厂类，无须对原工厂进行任何修改，满足开闭原则。 缺点：每增加一个产品就要增加一个具体产品类和一个对应的具体工厂类，这增加了系统的复杂度。
    //这种使用场景是明确要创建某个类的实例。所以这种京东卖多类品种手机不是特别适用，客户端这样用的话会和多个具体工厂类耦合，一样要做很多入参的判断。工厂方法模式最恰当的例子是数据解析，拿到一个类，直接返回这个类的实例，可以当做这个类既是具体工厂类，又是产品类。有时间找一下系统中运用这种设计模式的东西。
    NSInteger customStyle = 1+arc4random()%3;
    JDQJCorp2 *jdCorp = [JDQJCorp2 new];
    id<PhoneFactroy2> data = [IPhoneFactroy2 new];
    Phone2 *phone = [data outputPhone];
    [jdCorp salePhone:phone];
    [phone showName];
    
//    NSLog(@"%@",);
}
@end
