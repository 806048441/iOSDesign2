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
 
 原型模式角色：
 抽象原型类：规定了具体原型对象必须实现的 clone() 方法。
 具体原型类：实现抽象原型类的 clone() 方法，它是可被复制的对象。
 访问类：使用具体原型类中的 clone() 方法来复制新的对象。
 
 原型模式使用场景：
 对象的创建非常复杂，可以使用原型模式快捷的创建对象。
 性能和安全要求比较高。
 
 
 实例、真实场景，商家核验助手做信息缓存的时候*/
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
