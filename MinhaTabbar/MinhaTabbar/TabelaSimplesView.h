//
//  TabelaSimplesView.h
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 23/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelaSimplesView : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *arrayDados;

@end
