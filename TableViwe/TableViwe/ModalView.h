//
//  ModalView.h
//  TableViwe
//
//  Created by Marina Melo Pires on 21/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalView : UIViewController<UIWebViewDelegate>
@property(nonatomic, strong) NSDictionary *dict;
@property(nonatomic, strong) IBOutlet UIWebView *myWebView;
@property(nonatomic, strong) IBOutlet UIActivityIndicatorView *myLoading;

@end
