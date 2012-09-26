//
//  ModalView.m
//  TableViwe
//
//  Created by Marina Melo Pires on 21/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ModalView.h"

@interface ModalView ()

@end

@implementation ModalView

@synthesize dict;
@synthesize myLoading;
@synthesize myWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *string = [self.dict objectForKey:@"url"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
    // Do any additional setup after loading the view from its nib.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.myLoading setHidden:FALSE];
    [self.myLoading startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.myLoading stopAnimating];
    [self.myLoading setHidden:TRUE];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
