# WFLSwitch
self.switchView = [[WFLSwitchView alloc]initWithFrame:CGRectMake(200, 200, 130, 40) isOn:YES];
    self.switchView.onText = @"已开启";
    self.switchView.offText = @"已关闭";
    self.switchView.onBgolor = [UIColor redColor];
    self.switchView.offBgColor = [UIColor blackColor];
    self.switchView.font = [UIFont systemFontOfSize:19];
    self.switchView.changeStateBlock = ^(BOOL isOn) {
        if (isOn) {
            NSLog(@"已开启了！");
        } else {
            NSLog(@"已关闭了！");
        }
    };
    [self.view addSubview:self.switchView];

/*因为开始的设定是在font 设置以后更新的UI 所以font的属性设置要放在最后 不然不显示最初的状态*/
