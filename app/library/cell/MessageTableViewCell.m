//
//  MessageTableViewCell.m
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell
@synthesize name = _name;
@synthesize message = _message;
@synthesize date = _date;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(17, 5, 200, 17)];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont fontWithName:fontDefault size:16];
        _name.text = @"Nexus";
        
        _date = [[UILabel alloc]initWithFrame:CGRectMake(320-120, 5, 100, 14)];
        _date.textAlignment = NSTextAlignmentLeft;
        _date.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:12];
        _date.text = @"3 Days Ago";
        _date.textAlignment = NSTextAlignmentRight;
        
        _message = [[UILabel alloc]initWithFrame:CGRectMake(17, 25, 300, 17)];
        _message.textAlignment = NSTextAlignmentLeft;
        _message.textColor = [UIColor lightGrayColor];
        _message.numberOfLines = 3;
        _message.font = [UIFont fontWithName:fontDefault size:13];
        _message.text = @"Nexus";
        
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_message];
        [self.contentView addSubview:_date];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
