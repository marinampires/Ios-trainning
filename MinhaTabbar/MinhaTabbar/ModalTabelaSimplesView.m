//
//  ModalTabelaSimplesController.m
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ModalTabelaSimplesView.h"

@interface ModalTabelaSimplesView ()

@end

@implementation ModalTabelaSimplesView

@synthesize linhaClicada, botaoLinhaClicada;

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
    [self.botaoLinhaClicada setTitle: [NSString stringWithFormat: @"Linha clicada foi %d", self.linhaClicada] forState:UIControlStateNormal ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voltar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
