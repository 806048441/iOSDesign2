//
//  AppDelegate.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/6/29.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyWindow];
    return YES;
}


@end
