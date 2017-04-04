//
//  TransportTableViewCell.m
//  TransportList
//
//  Created by Сергей on 04.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "TransportTableViewCell.h"

@implementation TransportTableViewCell
@synthesize model = _model;
@synthesize company = _company;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
