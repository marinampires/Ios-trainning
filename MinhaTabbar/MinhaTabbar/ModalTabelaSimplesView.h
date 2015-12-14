//
//  ModalTabelaSimplesController.h
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalTabelaSimplesView : UIViewController

@property(nonatomic) NSInteger linhaClicada;

@property(nonatomic, strong) IBOutlet UIButton *botaoLinhaClicada;

- (IBAction)voltar:(id)sender;
@end
