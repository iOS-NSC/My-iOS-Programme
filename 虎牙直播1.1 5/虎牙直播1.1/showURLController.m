//
//  showURLController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "showURLController.h"
#import <WebKit/WebKit.h>
@interface showURLController ()<WKNavigationDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation showURLController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"http://www.huya.com/chuhe?from=huyalive"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}
- (void) webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}


- (void) webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}


- (void) webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"%@",error.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
