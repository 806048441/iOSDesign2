//
//  BuilderClient2.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/12.
//

#import "BuilderClient2.h"
#import <UIKit/UIKit.h>

@interface BuilderAlertView2 : UIView

@end

@implementation BuilderAlertView2

@end


@protocol AbstractAlertViewBuilderProtocol2 <NSObject>
- (void)buildTitle;
- (void)buildContent;
- (void)buildActions;
@end


/// 指挥者类 和 抽象建造者类 变成一个 很多业务会这样用
@interface AbstractAlertViewBuilder2 : NSObject <AbstractAlertViewBuilderProtocol2>

@property (strong, nonatomic) BuilderAlertView2 *builderAlert;
@end

@implementation AbstractAlertViewBuilder2

- (BuilderAlertView2 *)builderAlert {
    
    if (!_builderAlert) {
        
        _builderAlert  =[[BuilderAlertView2 alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _builderAlert.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }
    return _builderAlert;
}

- (void)buildTitle {
    
    NSLog(@"###子类实现%s###",__func__);
}

- (void)buildContent {
    
    NSLog(@"###子类实现%s###",__func__);
}

- (void)buildActions {
        
    NSLog(@"###子类实现%s###",__func__);
}

- (BuilderAlertView2 *)construct {
    
    [self buildTitle];
    [self buildContent];
    [self buildActions];
    return self.builderAlert;
}

@end

@interface SimpleAlertViewBuilder2 : AbstractAlertViewBuilder2

@end

@implementation SimpleAlertViewBuilder2
    
- (void)buildTitle {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"simple title";
    [self.builderAlert addSubview:label];
}

- (void)buildContent {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100+100, 200, 100)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"simple content";
    [self.builderAlert addSubview:label];
}

- (void)buildActions {
        
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100+100+100, 150, 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"simple actions";
    [self.builderAlert addSubview:label];
}

@end

@interface ComplexAlertViewBuilder2 : AbstractAlertViewBuilder2

@end

@implementation ComplexAlertViewBuilder2
    
- (void)buildTitle {
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"builder"];
    imageView.layer.masksToBounds = YES;
    [self.builderAlert addSubview:imageView];
}

- (void)buildContent {
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100+100, 200, 100)];
    imageView.image = [UIImage imageNamed:@"builder2"];
    imageView.layer.masksToBounds = YES;
    [self.builderAlert addSubview:imageView];
}

- (void)buildActions {
        
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100+100+100, 150, 100)];
    imageView.image = [UIImage imageNamed:@"builder3"];
    imageView.layer.masksToBounds = YES;
    [self.builderAlert addSubview:imageView];
}

@end

@interface BuilderClient2 ()

@end

@implementation BuilderClient2

+ (void)test {
    
    ComplexAlertViewBuilder2 *builder = [ComplexAlertViewBuilder2 new];
    BuilderAlertView2 *builderAlert =  builder.construct;
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:builderAlert];
    
}
@end

