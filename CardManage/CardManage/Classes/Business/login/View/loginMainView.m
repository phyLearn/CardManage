//
//  loginMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "loginMainView.h"
#import "newsLoginView.h"
#import "passwordLoginView.h"

@interface loginMainView()

@property (strong, nonatomic) UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *changeLoginTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;

@end
@implementation loginMainView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self createLoginView];
}

- (UIScrollView *)mainScrollView{
    if(!_mainScrollView){
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.backgroundColor = [UIColor clearColor];
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.bounces = NO;
        _mainScrollView.scrollEnabled = NO;
        [self addSubview:_mainScrollView];
        [_mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-50);
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(101);
        }];
        //更新布局
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
    return _mainScrollView;
}

- (void)createLoginView{
    self.mainScrollView.contentSize = CGSizeMake(self.mainScrollView.frame.size.width * 2, 0);
    CGFloat scrollViewWidth = self.mainScrollView.frame.size.width;
    CGFloat scrollViewHeight = self.mainScrollView.frame.size.height - 1;
    newsLoginView *newsView = [[NSBundle mainBundle] loadNibNamed:@"newsLoginView" owner:self options:0][0];
    newsView.frame = CGRectMake(0, 0, scrollViewWidth, scrollViewHeight);
    [self.mainScrollView addSubview:newsView];
    
    passwordLoginView *passView = [[NSBundle mainBundle] loadNibNamed:@"passwordLoginView" owner:self options:0][0];
    passView.frame = CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight);
    [self.mainScrollView addSubview:passView];
    
    //添加下划线
    [self addLineViewWithFrame:CGRectMake(20, self.mainScrollView.origin.y + scrollViewHeight / 2, scrollViewWidth, 1)];
    [self addLineViewWithFrame:CGRectMake(20, self.mainScrollView.origin.y + scrollViewHeight + 1, scrollViewWidth, 1)];
}

- (void)addLineViewWithFrame:(CGRect)rect{
    UIView *lineView = [[UIView alloc] initWithFrame:rect];
    lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:lineView];
}

- (IBAction)changeLoginTypeAction:(UIButton *)sender{
    CGFloat contentOffSet = self.mainScrollView.contentOffset.x;
    if(0 == contentOffSet){
        [UIView animateWithDuration:0.5 animations:^{
            self.mainScrollView.contentOffset = CGPointMake(self.mainScrollView.frame.size.width, 0);
        }];
        [self.changeLoginTypeBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
        self.forgetBtn.hidden = NO;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.mainScrollView.contentOffset = CGPointMake(0, 0);
        }];
        [self.changeLoginTypeBtn setTitle:@"密码登录" forState:UIControlStateNormal];
        self.forgetBtn.hidden = YES;
    }
}

- (IBAction)loginBtnAction:(UIButton *)sender {
    NSMutableDictionary *loginInfo = [NSMutableDictionary dictionary];
    [loginInfo setValue:@"18711093252" forKey:@"mobile"];
    [loginInfo setValue:@"123456" forKey:@"password"];
    [loginInfo setValue:@"2" forKey:@"loginType"];
    
    if(self.loginBtnClick)
        self.loginBtnClick([loginInfo copy]);
}

- (IBAction)backBtnAction:(UIButton *)sender {
    if(self.backBtnClick)
        self.backBtnClick();
}

@end
