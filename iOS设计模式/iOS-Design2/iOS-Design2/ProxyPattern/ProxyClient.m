//
//  ProxyClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/19.
//

#import "ProxyClient.h"

//模拟代理 控制角色权限 这个服务端可能用的比较多

@protocol NormalUserProtocol <NSObject>

- (id)readFromMemory;
@end

@protocol ViperProtocol <NSObject>

- (id)readFromMemoryOrDisk;
@end

@protocol ManagerProtocol <NSObject>

- (id)readFromMemoryOrDisk;
- (BOOL)writeToMemoryAndDisk:(id)data;
@end

@interface DataOperate : NSObject <NormalUserProtocol, ViperProtocol, ManagerProtocol>

@end

@implementation DataOperate

- (id)readFromMemory { //读取内存中全量信息
    
    NSString *memoryData = @"内存数据";
    NSLog(@"从内存读到了数据");
    return memoryData;
}

- (id)readFromMemoryOrDisk { //读取内存和服务器中全量信息
    
    NSString *diskData = @"内存|硬盘数据";
    NSLog(@"从内存|硬盘读到了数据");
    return diskData;
}

- (BOOL)writeToMemoryAndDisk:(id)data { //往缓存和服务器中添加信息
    
    NSLog(@"往内存写了数据%@",data);
    NSLog(@"往硬盘写了数据%@",data);
    return YES;
}
@end

@interface NormalUser : NSObject <NormalUserProtocol>

@property (strong, nonatomic) DataOperate *dataOperate;

@end

@implementation NormalUser

- (DataOperate *)dataOperate {
    
    if (!_dataOperate) {
        
        _dataOperate = [[DataOperate alloc]init];
    }
    return _dataOperate;
}


- (id)readFromMemory {
    
    NSLog(@"%@读数据",NSStringFromClass(self.class));
    if ([self.dataOperate respondsToSelector:@selector(readFromMemory)]) {
        
        id data = [self.dataOperate readFromMemory];
        if ([data isKindOfClass:NSString.class]) { //控制权限 只能读缓存中基本信息
            
            return data;
        }
    }
   
    return nil;
}

@end

@interface Viper : NSObject <ViperProtocol>

@property (strong, nonatomic) DataOperate *dataOperate;

@end

@implementation Viper

- (DataOperate *)dataOperate {
    
    if (!_dataOperate) {
        
        _dataOperate = [[DataOperate alloc]init];
    }
    return _dataOperate;
}


- (id)readFromMemoryOrDisk {
    
    NSLog(@"%@读数据",NSStringFromClass(self.class));
    if ([self.dataOperate respondsToSelector:@selector(readFromMemoryOrDisk)]) {
        
        id data = [self.dataOperate readFromMemoryOrDisk];
        if ([data isKindOfClass:NSString.class] || [data isKindOfClass:NSDictionary.class]) { //控制权限 只能读缓存|服务器硬盘中的基本信息、起诉信息、经营信息等等
            
            return data;
        }
    }
    return nil;
}

@end

@interface Manager : NSObject <ManagerProtocol>

@property (strong, nonatomic) DataOperate *dataOperate;

@end

@implementation Manager

- (DataOperate *)dataOperate {
    
    if (!_dataOperate) {
        
        _dataOperate = [[DataOperate alloc]init];
    }
    return _dataOperate;
}


- (id)readFromMemoryOrDisk {
    
    NSLog(@"%@读数据",NSStringFromClass(self.class));
    if ([self.dataOperate respondsToSelector:@selector(readFromMemoryOrDisk)]) {
        
        return [self.dataOperate readFromMemoryOrDisk];
    }
    return nil;
}

- (BOOL)writeToMemoryAndDisk:(id)data {
    
    NSLog(@"%@写数据",NSStringFromClass(self.class));
    if ([self.dataOperate respondsToSelector:@selector(writeToMemoryAndDisk:)]) {
        
        return [self.dataOperate writeToMemoryAndDisk:data];
    }
    return nil;
}

@end

@interface ProxyClient ()

@end


@implementation ProxyClient

- (void)test {
    
    [[NormalUser new] readFromMemory];
    [[Manager new] readFromMemoryOrDisk];
    [[Manager new] writeToMemoryAndDisk:@"三路崩,G了"];
}
@end
