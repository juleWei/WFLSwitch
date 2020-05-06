//
//  WFLSwitchView.h
//
//  Created by weifanle on 2019/7/26.
//  Copyright © 2019 weifanle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFLSwitchView : UIView

@property (nonatomic, strong) UILabel *contentLabel; //显示文字

@property (nonatomic, strong) UIColor *onBgolor; //开启时文字颜色
@property (nonatomic, strong) UIColor *offBgColor; //关闭时文字颜色

@property (nonatomic, copy) NSString *onText; //开启时文字
@property (nonatomic, copy) NSString *offText; //关闭时文字

@property (nonatomic, strong) UIColor *onTextColor; //开启时文字颜色
@property (nonatomic, strong) UIColor *offTextColor; //关闭时文字颜色

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) BOOL isOn; //记录开始的状态

@property (nonatomic, copy) void (^changeStateBlock)(BOOL isOn);

- (instancetype)initWithFrame:(CGRect)frame isOn:(BOOL)isON;

@end

NS_ASSUME_NONNULL_END
