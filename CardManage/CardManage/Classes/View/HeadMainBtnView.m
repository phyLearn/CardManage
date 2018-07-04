//
//  HeadMainBtnView.m
//  CardManage
//
//  Created by shanbao on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "HeadMainBtnView.h"
#import "CustomMainbBtn.h"

@interface HeadMainBtnView()

@property (nonatomic, strong) UIView * backgroundView;
@property (nonatomic, strong) UIView * mainBtnView;
@property (nonatomic, strong) NSMutableArray * mainBtnArr;

@end


@implementation HeadMainBtnView

-(id)initWithFrame:(CGRect)frame place:(NSString *)place{
    self = [super initWithFrame:frame];
    if (self) {
        [self newMainButtonWithPlace:place];
        [self addSubview:self.backgroundView];
    }
    return self;
}

-(void)newMainButtonWithPlace:(NSString *)place{
    if ([place isEqualToString:@"center"]) {
        self.mainBtnView = [[UIView alloc] initWithFrame:CGRectMake(15, 50, self.frame.size.width - 15*2, 100)];
        [self.mainBtnView setBackgroundColor:[UIColor clearColor]];
        [self.backgroundView addSubview:self.mainBtnView];
    }
    
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
            
        }else{
            UIButton *mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSDictionary *contentDict = self.mainBtnArr[i];
            
            CGFloat w = 26;
            CGFloat h = 26;
            mainBtn.frame = CGRectMake(15 +i * (w + 18), 0, w, h);
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

#pragma mark --- 初始化 ---
- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _backgroundView.backgroundColor = [UIColor blackColor];
    }
    return _backgroundView;
}

- (NSArray *)mainBtnArr{
    if(!_mainBtnArr){
        _mainBtnArr = @[
                        @{@"title":@"急速还款",@"image":@"haikuanx_35x35_",@"selector":@"fastPayment"},
                        @{@"title":@"完美还款",@"image":@"haikuanrilix_35x35_",@"selector":@"perfectPayment"},
                        @{@"title":@"信用卡办理",@"image":@"jsk_25x25_",@"selector":@"creditCard"},
                        @{@"title":@"自己借",@"image":@"zijiejie_45x45_",@"selector":@"byMyself"}
                        ];
    }
    return _mainBtnArr;
}

@end