//
//  thridHomeViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/6/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "thridHomeViewController.h"
#import <WebKit/WebKit.h>

@interface thridHomeViewController ()
<
    WKUIDelegate,
    WKNavigationDelegate
>
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation thridHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //webview
    [self layoutWebView];
}

#pragma mark --- 配置相关 ---


#pragma mark --- 布局相关 ---
- (void)layoutWebView{
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark --- 初始化 ---
- (WKWebView *)webView{
    if(!_webView){
        _webView = [[WKWebView alloc] init];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.scrollView.bounces = NO;
        [self.view addSubview:_webView];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURL *baseURL = [NSURL fileURLWithPath:path];
        [_webView loadRequest:[NSURLRequest requestWithURL:baseURL]];
    }
    return _webView;
}
@end
