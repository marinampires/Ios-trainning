//
//  ModalTabelaCustomizadaView.m
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ModalTabelaCustomizadaView.h"

@interface ModalTabelaCustomizadaView ()

@end

@implementation ModalTabelaCustomizadaView

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
    self.labelLinhaClicada.text = self.mensagem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
