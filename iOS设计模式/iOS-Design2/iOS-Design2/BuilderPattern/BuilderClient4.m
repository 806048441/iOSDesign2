//
//  BuilderClient4.m
//  iOS-Design2
//
//  Created by 神州第一坑 on 2022/7/12.
//

#import "BuilderClient4.h"
#import <UIKit/UIKit.h>
#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

#define RandomColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@class AbstractAlertViewBuilder4;
typedef AbstractAlertViewBuilder4 *(^BuilderClient4StringBlock)(NSString *string);
typedef AbstractAlertViewBuilder4 *(^BuilderClient4LabelBlock)(UILabel *label);
typedef AbstractAlertViewBuilder4 *(^BuilderClient4TextFieldBlock)(UITextField *textField);

@interface BuilderAlert4 : UIView

@end

@implementation BuilderAlert4

@end

@interface AbstractAlertViewBuilder4 : NSObject
{
    
    CGFloat _bottom;
}
@property (strong, nonatomic) BuilderAlert4 *builderAlert;
- (BuilderClient4StringBlock)addTitle;
- (BuilderClient4StringBlock)addContent;
- (BuilderClient4StringBlock)addAction;
- (BuilderClient4LabelBlock)addLabel;
- (BuilderClient4TextFieldBlock)addTextField;
@end

@implementation AbstractAlertViewBuilder4

- (BuilderAlert4 *)builderAlert {
    
    if (!_builderAlert) {
        
        _builderAlert = [[BuilderAlert4 alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _builderAlert.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }
    return _builderAlert;
}

- (BuilderClient4StringBlock)addTitle {
    
    return ^AbstractAlertViewBuilder4 *(NSString *string) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self->_bottom, 100, 100)];
        label.text = string;
        label.backgroundColor = RandomColor;
        [self.builderAlert addSubview:label];
        self->_bottom += label.bounds.size.height;
        return self;
    };
}

- (BuilderClient4StringBlock)addContent {

    return ^AbstractAlertViewBuilder4 *(NSString *string) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, self->_bottom, 200, 100)];
        label.text = string;
        label.backgroundColor = RandomColor;
        [self.builderAlert addSubview:label];
        self->_bottom += label.bounds.size.height;
        return self;
    };
   
}

- (BuilderClient4StringBlock)addAction {
    
    return ^AbstractAlertViewBuilder4 *(NSString *string) {
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, self->_bottom, 100, 100)];
        [button setTitle:string forState:UIControlStateNormal];
        button.backgroundColor = RandomColor;
        [self.builderAlert addSubview:button];
        self->_bottom += button.bounds.size.height;
        return self;
    };
}

- (BuilderClient4LabelBlock)addLabel {

    return ^AbstractAlertViewBuilder4 *(UILabel *label) {
        
        label.frame = CGRectMake(0, self->_bottom, label.bounds.size.width, label.bounds.size.height);
        label.backgroundColor = RandomColor;
        [self.builderAlert addSubview:label];
        self->_bottom += label.bounds.size.height;
        return self;
    };
}

- (BuilderClient4TextFieldBlock)addTextField {

    return ^AbstractAlertViewBuilder4 *(UITextField *textField) {
        
        textField.frame = CGRectMake(0, self->_bottom, textField.bounds.size.width, textField.bounds.size.height);
        textField.backgroundColor = RandomColor;
        [self.builderAlert addSubview:textField];
        self->_bottom += textField.bounds.size.height;
        return self;
    };
}

@end

@interface BuilderClient4 ()

@end

@implementation BuilderClient4

+ (void)test {
    
    AbstractAlertViewBuilder4 *builder = [[AbstractAlertViewBuilder4 alloc]init];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    textField.backgroundColor = RandomColor;
    BuilderAlert4 *builderAlert =
    builder.
    addTitle(@"title").
    addContent(@"content").
    addContent(@"content2").
    addAction(@"aciton").
    addTextField(textField).builderAlert;
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:builderAlert];
}
@end
