//
//  MainNavigationController.m
//  AppFramework
//
//  Created by Penghuaiyu on 16/10/12.
//  Copyright © 2016年 Penghuaiyu. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()
@property (nonatomic, strong) NSDictionary *infoDict;

@end

@implementation MainNavigationController

/**
 *  懒加载json数据
 */
- (NSDictionary *)infoDict
{
    if(!_infoDict)
    {
        NSDictionary *dict = [appAppearInfo getInfoDict];
        _infoDict = dict[@"changeData"][@"nav"];
    }
    return _infoDict;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self navMotif];
}

//设置导航栏主题
- (void)navMotif
{
    UINavigationBar *bar = [UINavigationBar appearance];//统一设置主题
    //改变背景
    if(self.infoDict[@"backgroundImg"]){
        [bar setBackgroundImage:[UIImage imageNamed:self.infoDict[@"backgroundImg"]] forBarMetrics:UIBarMetricsDefault];
    }else{
        //设置主题颜色
        [bar setBarTintColor:[UIColor colorWithHexString:self.infoDict[@"backColor"]]];
    }
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:self.infoDict[@"titleColor"]],NSFontAttributeName:[UIFont boldSystemFontOfSize:[self.infoDict[@"titleFont"] intValue]]};
}

/**
 *  自定义push
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        // 自定义返回按钮
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [btn.widthAnchor constraintEqualToConstant:30].active = YES;
        [btn.heightAnchor constraintEqualToConstant:30].active = YES;
        
        [btn setImage:[UIImage imageNamed:self.infoDict[@"backImg"]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];
}

@end
