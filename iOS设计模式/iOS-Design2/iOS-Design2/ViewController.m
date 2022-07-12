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
#import "PrototypeClient.h"
#import "BuilderClient.h"
#import "BuilderClient2.h"
#import "BuilderClient3.h"
#import "BuilderClient4.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
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
    
//    [[PersonFactoryMethodClient2 new] test];
    
//    [PrototypeClient test];
    
    [BuilderClient4 test];

}


@end
