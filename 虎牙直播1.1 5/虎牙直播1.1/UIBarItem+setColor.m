//
//  UIBarItem+setColor.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIBarItem+setColor.h"
#import "allTopController.h"
@implementation UIBarItem (setColor)

- (void)settitlEColor
{
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName:[UIColor orangeColor]
                          };
    [self setTitleTextAttributes:dic forState:UIControlStateHighlighted];
    
}



@end
