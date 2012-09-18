//
//  MyCell.m
//  CustomCell
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
