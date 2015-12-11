//
//  BTViewWebController.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTViewWebController.h"

@interface BTViewWebController ()

@property(nonatomic,strong)UIWebView *webView;

@property(nonatomic,strong)NSString *httpStr;

@end

@implementation BTViewWebController

- (instancetype)initWithHttpStr:(NSString *)httpStr withTitle:(NSString *)title
{
    
    self = [super init];
    
    if (self) {
        
        _httpStr = httpStr;
        
        self.navigationItem.title = title;
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadString:_httpStr];
    
}

- (void)loadString:(NSString *)str
{

    NSURL *url = [NSURL URLWithString:str];
    
    // 2. 把URL告诉给服务器,请求,从m.baidu.com请求数据
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 发送请求给服务器
    [self.webView loadRequest:request];
    
}

- (UIWebView *)webView
{
    
    if (!_webView) {
        
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        
        _webView.dataDetectorTypes = UIDataDetectorTypeAll;
        
        [self.view addSubview:_webView];
        
    }
    
    return _webView;
    
}

@end
