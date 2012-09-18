//
//  ViewController.m
//  HelloWord
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel* umLabel = [[UILabel alloc] init];
    umLabel.frame = CGRectMake(10, 10, 300, 50);
    umLabel.text = @"Meu primeiro uiLabel";
    umLabel.textAlignment = UITextAlignmentCenter;
    umLabel.textColor = [UIColor whiteColor];
    umLabel.backgroundColor = [UIColor colorWithRed:0.376 green:0.353 blue:0.682 alpha:1];
    umLabel.font = [UIFont boldSystemFontOfSize: 25];

    UILabel* doisLabel = [[UILabel alloc] init];
    doisLabel.frame = CGRectMake(10, 70, 300, 50);
    doisLabel.text = @"Meu segundo uiLabel";
    doisLabel.textAlignment = UITextAlignmentRight;
    doisLabel.textColor = [UIColor whiteColor];
    doisLabel.backgroundColor = [UIColor colorWithRed:0.176 green:0.153 blue:0.182 alpha:1];
    doisLabel.font = [UIFont boldSystemFontOfSize: 20];
    
    [self.view addSubview:umLabel];
    [self.view addSubview:doisLabel];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
