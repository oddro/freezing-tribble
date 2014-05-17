//
//  MessageTableViewCell.h
//  SMS Guard
//
//  Created by Arie Prasetyo on 5/17/14.
//  Copyright (c) 2014 enervo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *message;
@property (nonatomic,strong) UILabel *date;
@end
