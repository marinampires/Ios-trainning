//
//  WebViewController.h
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic, strong) IBOutlet UIWebView *myWebView;
@property(nonatomic, strong) IBOutlet UIToolbar *webToolbar;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *botaoVoltar;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *botaoReload;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *botaoAdiantar;

- (void)updateButtons;

@end
