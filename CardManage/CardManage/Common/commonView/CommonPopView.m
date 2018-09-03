//
//  CommonPopView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CommonPopView.h"
#import "ZJAnimationPopView.h"

@interface CommonPopView()

@property (nonatomic, strong) ZJAnimationPopView *materialPopView;//资料完善弹框

@end
@implementation CommonPopView

+(instancetype)shared{
    static CommonPopView *popView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popView = [[CommonPopView alloc] init];
    });
    return popView;
}

- (void)showMaterialPopView{
    self.materialPopView = [[ZJAnimationPopView alloc] initWithCustomView:[self createMaterialPopView] popStyle:ZJAnimationPopStyleScale dismissStyle:ZJAnimationDismissStyleScale];
    self.materialPopView.popAnimationDuration = 0.5f;
    self.materialPopView.isClickBGDismiss = YES;
    [self.materialPopView pop];
}

//完善资料弹框样式
- (UIView *)createMaterialPopView{
    //自定义样式
    CGFloat backWidth = AppScreenWidth - 80;
    CGFloat backHeight = backWidth * 0.5;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backWidth, backHeight)];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 5;
    //添加标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, backWidth, 30)];
    titleLabel.text = @"提示";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [titleLabel setTextColor:[UIColor blackColor]];
    [backView addSubview:titleLabel];
    
    //添加描述
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), backWidth, 30)];
    descLabel.text = @"请完善资料";
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.font = [UIFont systemFontOfSize:14];
    [descLabel setTextColor:[UIColor blackColor]];
    [backView addSubview:descLabel];
    
    //添加确定按钮
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确定" forState: UIControlStateNormal];
    sureBtn.frame = CGRectMake(10, CGRectGetMaxY(descLabel.frame) + 10, backWidth - 20, (backWidth - 20) * 0.15);
    sureBtn.backgroundColor = [UIColor blueColor];
    [sureBtn addTarget:self action:@selector(materialSureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:sureBtn];
    
    return backView;
}

//点击移除完善资料框
- (void)materialSureBtnAction{
    [self.materialPopView dismiss];
}

@end
