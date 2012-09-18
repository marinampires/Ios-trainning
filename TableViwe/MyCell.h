//
//  MyCell.h
//  TableViwe
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

@property(strong, nonatomic) IBOutlet UILabel *pais;
@property(strong, nonatomic) IBOutlet UILabel *idioma;
@property(strong, nonatomic) IBOutlet UIImageView *bandeira;

@end
