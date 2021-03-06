//
//  userCheckOutLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "userCheckOutLogicManager.h"
#import "userCheckOutImport.h"

@interface userCheckOutLogicManager()

@property (nonatomic, strong) userCheckOutMainView *checkOutView;

@end
@implementation userCheckOutLogicManager

+(instancetype)shared{
    static userCheckOutLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[userCheckOutLogicManager alloc] init];
    });
    return logicManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"身份认证";
    self.checkOutView = [[NSBundle mainBundle] loadNibNamed:@"userCheckOutMainView" owner:self options:0][0];
    self.checkOutView.frame = vc.view.frame;
    [vc.view addSubview:self.checkOutView];
}

- (void)registerObserWithDele:(id)delegate{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(faceBtnAction) name:@"REGISTERFACEBTNCLICK" object:nil];
#pragma clang diagnostic pop
}

- (void)refreshFaceImage:(UIImage *)image{
    [self.checkOutView refreshFaceImageViewWithImage:image];
}
@end
