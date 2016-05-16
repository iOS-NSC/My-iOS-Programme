//
//  TextView.m
//  04-29-作业
//
//  Created by tarena04 on 16/5/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TextView.h"

@interface TextView ()

// 聊天内容
@property (nonatomic,strong) UILabel *label1;
// 昵称
@property (nonatomic,strong) UILabel *nameLabel;

@end

@implementation TextView

- (CGFloat) setLabel:(NSString *) title
{
    self.label1 = [[UILabel alloc] init];
    self.nameLabel = [[UILabel alloc] init];
    self.label1.numberOfLines = 0;
    self.label1.text = title;
    self.label1.font = [UIFont systemFontOfSize:14];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    
    if (self.zuo == NO) {
        
        self.nameLabel.text = @"玛莎拉蒂:";

    }else
    {
        self.nameLabel.text = @"楚河我是汉界:";
        self.nameLabel.textColor = [UIColor orangeColor];
    }

    CGSize size = [self.label1 sizeThatFits:CGSizeMake(200, self.frame.size.height)];
    self.label1.frame = CGRectMake(10, 25, size.width, size.height);
    self.label1.textColor = [UIColor grayColor];
    self.nameLabel.frame = CGRectMake(10, 0, 300, 20);

    [self addSubview:self.nameLabel];
    [self addSubview:self.label1];

    return self.label1.frame.size.height + 30;
}


@end
