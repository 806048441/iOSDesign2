//
//  BuilderClient.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/1.
//

#import "BuilderClient.h"
#import <UIKit/UIKit.h>

//例子是一个构造警告框的例子
@interface BuilderAlertView : UIView

@end

@implementation BuilderAlertView

@end


@protocol AbstractAlertViewBuilderProtocol <NSObject>
- (void)buildTitle;
- (void)buildContent;
- (void)buildActions;
@end

@interface AbstractAlertViewBuilder : NSObject <AbstractAlertViewBuilderProtocol>

@property (strong, nonatomic) BuilderAlertView *builderAlert;
@end

@implementation AbstractAlertViewBuilder

- (BuilderAlertView *)builderAlert {
    
    if (!_builderAlert) {
        
        _builderAlert  =[[BuilderAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
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

@end

@interface SimpleAlertViewBuilder : AbstractAlertViewBuilder

@end

@implementation SimpleAlertViewBuilder
    
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

@interface ComplexAlertViewBuilder : AbstractAlertViewBuilder

@end

@implementation ComplexAlertViewBuilder
    
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

@interface AlertViewDirector : NSObject //指挥者

@property (strong, nonatomic) AbstractAlertViewBuilder *builder;
@end

@implementation AlertViewDirector

- (void)setBuilder:(AbstractAlertViewBuilder *)builder {
    
    _builder = builder;
}

- (BuilderAlertView *)construct {
    
    if (!self.builder) {
        
        return nil;
    }
    [self.builder buildTitle];
    [self.builder buildContent];
    [self.builder buildActions];
    return self.builder.builderAlert;
}

@end

@interface BuilderClient ()

@end

@implementation BuilderClient

+ (void)test {
    
    AlertViewDirector *director = [[AlertViewDirector alloc]init];
    [director setBuilder:[ComplexAlertViewBuilder new]];
    BuilderAlertView *builderAlert =  director.construct;
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:builderAlert];
    
}
@end
