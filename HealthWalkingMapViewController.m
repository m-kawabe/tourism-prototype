//
//  HealthWalkingMapViewController.m
//  tourism_prototype
//
//  Created by 河辺 雅史 on 2014/07/31.
//  Copyright (c) 2014年 河辺 雅史. All rights reserved.
//

#import "HealthWalkingMapViewController.h"

@interface HealthWalkingMapViewController ()

@end

@implementation HealthWalkingMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myWebView.delegate = self;
    NSURL *myURL = [NSURL URLWithString:@"http://www.city.hakodate.hokkaido.jp/docs/2014012700900/files/goryoukakuyanagawa.pdf"];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [self.myWebView loadRequest:myURLReq];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

//戻るボタンのアクション
- (IBAction)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
