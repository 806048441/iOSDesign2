//
//  PrototypeClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/1.
//

#import "PrototypeClient.h"

@protocol PrototypeClone <NSObject>

- (instancetype)clone;
@end

@interface DeepClonePerson : NSObject <PrototypeClone>

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@end

@implementation DeepClonePerson

- (instancetype)clone {
    
    DeepClonePerson *person = [[DeepClonePerson alloc]init];
    person.name = self.name;
    person.age = self.age;
    return person;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"指针地址:%p,name=%@,age=%ld",self,self.name,self.age];
}
@end

@interface ShallowClonePerson : NSObject <PrototypeClone>

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@end

@implementation ShallowClonePerson

- (instancetype)clone {
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"指针地址:%p,name=%@,age=%ld",self,self.name,self.age];
}
@end

@interface PrototypeClient ()

@end


@implementation PrototypeClient

/**用一个已经创建的实例作为原型，通过复制该原型对象来创建一个和原型对象相同的新对象。
 真实场景，商家核验助手做信息缓存的时候*/
+ (void)test {
    
    DeepClonePerson *deepPerson = [[DeepClonePerson alloc]init];
    deepPerson.age = 10;
    deepPerson.name = @"xiaoMing";
    
    DeepClonePerson *deepClonePerson = [deepPerson clone];
    deepClonePerson.name = @"xiaoHua";
    
    NSLog(@"%@,%@",deepPerson,deepClonePerson);
    
    ShallowClonePerson *shallowPerson = [[ShallowClonePerson alloc]init];
    shallowPerson.age = 10;
    shallowPerson.name = @"daMing";
    
    ShallowClonePerson *shallowClonePerson = [shallowPerson clone];
    shallowClonePerson.name = @"daHua";
    
    NSLog(@"%@,%@",shallowPerson,shallowClonePerson);
}

@end
