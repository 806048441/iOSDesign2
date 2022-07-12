//
//  BuilderClient3.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/12.
//

#import "BuilderClient3.h"
#import <UIKit/UIKit.h>
#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

#define RandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

//接口不能实现.调用 .调用需要返回值的。 所以排除这种写法，虽然这种耦合低
@protocol AbstractAlertViewProtocol <NSObject>

@optional
- (void)addTitle:(NSString *)title;
- (void)addContent:(NSString *)content;
- (void)addAction:(NSString *)action;
- (void)addLabel:(UILabel *)label;
- (void)addTextField:(UITextField *)textField;
@end

@interface BuilderAlert3 : UIView

@end

@implementation BuilderAlert3

@end

@interface AbstractAlertViewBuilder3 : NSObject
{
    
    CGFloat _bottom;
}
@property (strong, nonatomic) BuilderAlert3 *builderAlert;
- (AbstractAlertViewBuilder3 *)addTitle:(NSString *)title;
- (AbstractAlertViewBuilder3 *)addContent:(NSString *)content;
- (AbstractAlertViewBuilder3 *)addAction:(NSString *)action;
- (AbstractAlertViewBuilder3 *)addLabel:(UILabel *)label;
- (AbstractAlertViewBuilder3 *)addTextField:(UITextField *)textField;
@end

@implementation AbstractAlertViewBuilder3

- (BuilderAlert3 *)builderAlert {
    
    if (!_builderAlert) {
        
        _builderAlert = [[BuilderAlert3 alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _builderAlert.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }
    return _builderAlert;
}

- (AbstractAlertViewBuilder3 *)addTitle:(NSString *)title {
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _bottom, 100, 100)];
    label.text = title;
    label.backgroundColor = RandomColor;
    [self.builderAlert addSubview:label];
    _bottom += label.bounds.size.height;
    return self;
}

- (AbstractAlertViewBuilder3 *)addContent:(NSString *)content {
 
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, _bottom, 200, 100)];
    label.text = content;
    label.backgroundColor = RandomColor;
    [self.builderAlert addSubview:label];
    _bottom += label.bounds.size.height;
    return self;
}

- (AbstractAlertViewBuilder3 *)addAction:(NSString *)action {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, _bottom, 100, 100)];
    [button setTitle:action forState:UIControlStateNormal];
    button.backgroundColor = RandomColor;
    [self.builderAlert addSubview:button];
    _bottom += button.bounds.size.height;
    return self;
}


/// 添加view的坐标也可以不进行转换 这里是为了更符合实际场景
/// @param label <#label description#>
- (AbstractAlertViewBuilder3 *)addLabel:(UILabel *)label {
    
    label.frame = CGRectMake(0, _bottom, label.bounds.size.width, label.bounds.size.height);
    label.backgroundColor = RandomColor;
    [self.builderAlert addSubview:label];
    _bottom += label.bounds.size.height;
    return self;
}

- (AbstractAlertViewBuilder3 *)addTextField:(UITextField *)textField {
    
    textField.frame = CGRectMake(0, _bottom, textField.bounds.size.width, textField.bounds.size.height);
    textField.backgroundColor = RandomColor;
    [self.builderAlert addSubview:textField];
    _bottom += textField.bounds.size.height;
    return self;
}

@end

@interface BuilderClient3 ()

@end

@implementation BuilderClient3

+ (void)test {
    
    AbstractAlertViewBuilder3 *builder = [[AbstractAlertViewBuilder3 alloc]init];
    BuilderAlert3 *builderAlert = [[[builder addTitle:@"title"] addContent:@"content"] addAction:@"action"].builderAlert;
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:builderAlert];
}
@end
