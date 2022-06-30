//
//  ViewController.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "ViewController.h"
#import "SingleClient.h"
#import "SimpleFactoryClient.h"
#import "FactroyMethodClient.h"
#import "FactoryMethodClient2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [SimpleFactoryClient test1];
//    [SimpleFactoryClient test1];
//    [SimpleFactoryClient test1];
//    [SimpleFactoryClient test1];
//    [SimpleFactoryClient test1];
//    
//    [SimpleFactoryClient test2];
//    [SimpleFactoryClient test2];
//    [SimpleFactoryClient test2];
//    [SimpleFactoryClient test2];
//    [SimpleFactoryClient test2];

//    [FactroyMethodClient test];
//    [FactroyMethodClient test];
//    [FactroyMethodClient test];
//    [FactroyMethodClient test];
    
    [[PersonFactoryMethodClient2 new] test];

}


@end
