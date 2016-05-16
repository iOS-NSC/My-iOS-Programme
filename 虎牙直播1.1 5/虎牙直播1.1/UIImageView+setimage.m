//
//  UIImageView+setimage.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImageView+setimage.h"

@implementation UIImageView (setimage)


- (void) setImageViewLayer
{
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.layer.masksToBounds = YES;
}




@end
