//
//  WebViewController.m
//  Week1Assessment
//
//  Created by Max Lettenberger on 5/15/15.
//  Copyright (c) 2015 Max. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.answerString;
    [self loadRequestWithText:@"http://www.mobilemakers.co"];
    self.webView.delegate = self;

}

-(void)loadRequestWithText:(NSString *)text
{

    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest: request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{

   // self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.activityIndicator startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}



@end
