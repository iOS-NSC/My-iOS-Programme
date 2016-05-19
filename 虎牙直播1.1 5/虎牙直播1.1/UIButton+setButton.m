//
//  UIButton+setButton.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIButton+setButton.h"
#import "allTopController.h"


@implementation UIButton (setButton)

//static CGFloat tempButtonX;
//static CGFloat tempButtonW;


// 设置button的 frame 大小
- (instancetype) returnButton:(NSString *) name andX:(CGFloat) tempButtonX andW:(CGFloat)tempButtonW andButtonTag:(int) buttontag
{

    [self setTitle:name forState:(UIControlStateNormal)];
    [self setTitle:name forState:(UIControlStateSelected)];
    [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
    [self setBackgroundImage:[UIImage imageNamed:@"button_channel_spam_shield_selected"] forState:(UIControlStateSelected)];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 };
 
    CGRect nameSize = [name boundingRectWithSize:CGSizeMake(200, 50) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attributes context:nil];

    self.frame = CGRectMake(20 +  tempButtonW + tempButtonX, 5, nameSize.size.width + 10, nameSize.size.height + 8);
    
    tempButtonW = self.frame.size.width;
    tempButtonX = self.frame.origin.x;
    
    self.tag = buttontag;
    if (self.tag == 0) {
        self.selected = YES;
    }
    
    return self;
}







@end
