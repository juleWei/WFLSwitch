//
//  WFLSwitchView.m
//
//  Created by weifanle on 2019/7/26.
//  Copyright © 2019 weifanle. All rights reserved.
//

#import "WFLSwitchView.h"

@implementation WFLSwitchView

- (instancetype)initWithFrame:(CGRect)frame isOn:(BOOL)isON {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = self.frame.size.height / 2;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chage:)];
        self.layer.borderWidth = .5f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self addGestureRecognizer:tap];
        self.isOn = isON;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width / 5 * 3, self.frame.size.height)];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.backgroundColor = [UIColor whiteColor];
    self.contentLabel.clipsToBounds = YES;
    self.contentLabel.layer.cornerRadius = self.frame.size.height / 2;
    [self addSubview:self.contentLabel];
}

#pragma mark - setter

- (void)setFont:(UIFont *)font {
    self.contentLabel.font = font;
    //
    if (self.isOn) {
        [self stateOn];
    } else {
        [self stateOff];
    }
}

#pragma mark - UITapGestureRecognizer

- (void)chage:(UITapGestureRecognizer *)tap {
    self.isOn = !self.isOn;
    __weak __typeof(self)weakSelf = self;
    //
    if (self.isOn) {
        [UIView animateWithDuration:0 animations:^{
            [weakSelf stateOn];
        }];
    }else{
        [UIView animateWithDuration:0 animations:^{
            [weakSelf stateOff];
        }];
    }
    //
    if (self.changeStateBlock) {
        self.changeStateBlock(self.isOn);
    }
}

#pragma mark - chageStatue
//开启
- (void)stateOn {
    //默认背景色是绿色 文字为null 文字颜色是绿色
    self.backgroundColor = self.onBgolor != nil ? self.onBgolor :[UIColor greenColor];
    self.contentLabel.text = self.onText != nil ? self.onText : @"on";
    self.contentLabel.textColor = self.onTextColor != nil ? self.onTextColor : self.onBgolor;
    //
    CGRect frame = self.contentLabel.frame;
    frame.origin.x = 0;
    self.contentLabel.frame = frame;
}

//关闭

- (void)stateOff {
    //默认背景色是灰色 文字为null 文字颜色是绿色
    self.backgroundColor = self.offBgColor != nil ? self.offBgColor :[UIColor lightGrayColor];
    self.contentLabel.text = self.offText != nil ? self.offText : @"off";
    self.contentLabel.textColor = self.offTextColor != nil ? self.offTextColor : self.offBgColor;
    //
    CGRect fram = self.contentLabel.frame;
    fram.origin.x = fram.size.width / 3 * 2;
    self.contentLabel.frame = fram;
}

@end
