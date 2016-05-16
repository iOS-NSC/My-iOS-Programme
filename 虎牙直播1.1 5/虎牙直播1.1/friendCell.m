//
//  friendCell.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "friendCell.h"

@interface friendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *friendImageView;
@property (weak, nonatomic) IBOutlet UILabel *friendName;
@end

@implementation friendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
