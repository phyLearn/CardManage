//
//  HeadMainBtnView.m
//  CardManage
//
//  Created by shanbao on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeadMainBtnView.h"
#import "CustomMainbBtn.h"
#import "Masonry.h"
#import "HorseRaceLampView.h"

@interface HeadMainBtnView()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UIView * mainBtnView;
@property (nonatomic, strong) NSArray * mainBtnArr;

@end


@implementation HeadMainBtnView

-(id)initWithFrame:(CGRect)frame place:(NSString *)place messageArr:(NSArray *)messageArr{
    self = [super initWithFrame:frame];
    if (self) {
        [self newMainButtonWithPlace:place withMessageArr:messageArr];
        [self addSubview:self.backgroundView];
    }
    return self;
}

-(void)newMainButtonWithPlace:(NSString *)place withMessageArr:(NSArray *)messageArr{
    if ([place isEqualToString:@"center"]) {
        self.mainBtnView = [[UIView alloc] initWithFrame:CGRectMake(15, 60, self.frame.size.width - 15*2, 100)];
        [self.mainBtnView setBackgroundColor:[UIColor clearColor]];
        [self.backgroundView addSubview:self.mainBtnView];
        
        HorseRaceLampView * horseRaceView = [[HorseRaceLampView alloc] initWithFrame:CGRectMake(0, 150, self.frame.size.width, 30)];
        horseRaceView.messageTextArr = messageArr;
        [self.backgroundView addSubview:horseRaceView];
        //单击的手势
        UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap)];
        tapRecognize.numberOfTapsRequired = 1;
        tapRecognize.delegate = self;
        [tapRecognize setEnabled :YES];
        [tapRecognize delaysTouchesBegan];
        [tapRecognize cancelsTouchesInView];
        [horseRaceView addGestureRecognizer:tapRecognize];
        
    }
    
    UIButton *centerBtn = [[UIButton alloc] init];
    for(int i = 0; i < 4; i++){
        if([place isEqualToString:@"center"]){
            CustomMainbBtn *mainBtn = [CustomMainbBtn markButton];
            NSDictionary *contentDict = self.mainBtnArr[i];
            CGFloat w = 80;
            CGFloat h = 80;
            mainBtn.frame = CGRectMake(5 + i * 90, 10, w, h);
            if([place isEqualToString:@"center"]){
                [mainBtn setTitle:contentDict[@"title"] forState:UIControlStateNormal];
                [mainBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            mainBtn.tag = i + 1;
            [mainBtn addTarget:self action:@selector(mainBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [mainBtn setImage:[UIImage imageNamed:contentDict[@"image"]] forState:UIControlStateNormal];
            [self.mainBtnView addSubview:mainBtn];
            if(i == 0){
                [mainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.mainBtnView).offset(10);
                    make.left.mas_equalTo(self.mainBtnView);
                    make.bottom.mas_equalTo(self.mainBtnView).offset(0);
                    make.width.mas_equalTo(self.mainBtnView).multipliedBy(0.25);
                }];
            }else if (i == 3){
                [mainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.mainBtnView).offset(10);
                    make.right.mas_equalTo(self.mainBtnView);
                    make.bottom.mas_equalTo(self.mainBtnView).offset(0);
                    make.width.mas_equalTo(self.mainBtnView).multipliedBy(0.25);
                }];
            }else{
                [mainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.mainBtnView).offset(10);
                    make.left.mas_equalTo(centerBtn.mas_right);
                    make.bottom.mas_equalTo(self.mainBtnView).offset(0);
                    make.width.mas_equalTo(self.mainBtnView).multipliedBy(0.25);
                }];
            }
            centerBtn = mainBtn;
        }else{
            UIButton *mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSDictionary *contentDict = self.mainBtnArr[i];
            CGFloat w = 30;
            CGFloat h = 30;
            mainBtn.frame = CGRectMake(15 + i*(w+20), 30, w, h);
            mainBtn.tag = i + 1;
            [mainBtn addTarget:self action:@selector(mainBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [mainBtn setImage:[UIImage imageNamed:contentDict[@"image"]] forState:UIControlStateNormal];
            [self.backgroundView addSubview:mainBtn];
        }
    }
}

#pragma mark --- 动作 ---
- (void)mainBtnAction:(UIButton *)btn{
    NSInteger tag = btn.tag;
    NSDictionary *contentDict = self.mainBtnArr[tag - 1];
    if(self.mainBtnActionBlock){
        self.mainBtnActionBlock(contentDict[@"selector"]);
    }
}

- (void)handleTap{
    if (self.horseRaceBlock) {
        self.horseRaceBlock(@"horseRaceAction");
    }
}

#pragma mark --- 初始化 ---
- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _backgroundView.backgroundColor = [UIColor colorWithHexString:@"#141419"];
    }
    return _backgroundView;
}

- (NSArray *)mainBtnArr{
    if(!_mainBtnArr){
        _mainBtnArr = @[
                        @{@"title":@"急速还款",@"image":@"haikuanx_35x35_",@"selector":@"fastPayment"},
                        @{@"title":@"完美还款",@"image":@"haikuanrilix_35x35_",@"selector":@"perfectPayment"},
                        @{@"title":@"信用卡办理",@"image":@"xinyongka_45x45_",@"selector":@"creditCard"},
                        @{@"title":@"自己借",@"image":@"zijiejie_45x45_",@"selector":@"byMyself"}
                        ];
    }
    return _mainBtnArr;
}

@end
