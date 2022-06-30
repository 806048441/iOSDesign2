//
//  FactoryMethodClient2.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/30.
//

#import "FactoryMethodClient2.h"
#import <UIKit/UIKit.h>

/// 抽象工厂
@protocol ArrayDataAbstractFactroy <NSObject>

+ (NSArray *_Nullable)filterData:(NSArray *)originData;
@end


/// 具体工厂1
@interface PersonArrayDataFactroy : NSObject <ArrayDataAbstractFactroy>

@end

@implementation PersonArrayDataFactroy


/// 数组为产品
/// @param originData --
+ (NSArray * _Nullable)filterData:(NSArray *)originData {
    //假设处理这段数据用了300行代码
    return @[@"person"];
}

@end


/// 具体工厂类2
@interface DogArrayDataFactroy : NSObject <ArrayDataAbstractFactroy>
 
@end

@implementation DogArrayDataFactroy

/// 数组为产品
/// @param originData --
+ (NSArray * _Nullable)filterData:(NSArray *)originData {
    //假设处理这段数据用了300行代码
    return @[@"dog"];
}

@end


/// 具体工厂类3
@interface CarArrayDataFactory : NSObject <ArrayDataAbstractFactroy>

@end

@implementation CarArrayDataFactory

+ (NSArray * _Nullable)filterData:(NSArray *)originData {
    //假设处理这段数据用了300行代码
    return @[@"car"];
}

@end

/// 客户端基类
@interface FactoryMethodClient2 ()<UITableViewDataSource>

@property (strong, nonatomic, nullable) Class <ArrayDataAbstractFactroy>factory;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *serviceDataSource;
@end

@implementation FactoryMethodClient2

- (instancetype)init { //假装这类似于初始化代码
    
    self = [super init];
    if (self) {
        
        self.factory = nil;
        self.tableView.dataSource = self;
    }
    return self;
}

#pragma mark - custom
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.factory && self.serviceDataSource) {
        
        return [self.factory filterData:self.serviceDataSource].count;
    }
    return 0;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}

@end

///客户端子类
@interface PersonFactoryMethodClient2 ()


@end

@implementation PersonFactoryMethodClient2

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.factory = PersonArrayDataFactroy.class;
    }
    return self;
}

- (void)test {
    
    self.serviceDataSource = @[@"person1",@"person2"];
    NSLog(@"###%ld###",(long)[self tableView:self.tableView numberOfRowsInSection:0]);
}

#pragma mark - custom
#pragma mark - delegate

@end


