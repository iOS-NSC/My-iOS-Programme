//
//  UIImage+setImageOriginal.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImage+setImageOriginal.h"

@implementation UIImage (setImageOriginal)


+ (UIImage *) returdataImage
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *imagePath = [path stringByAppendingPathComponent:@"dataImage"];
    NSData *dataimage = [NSData dataWithContentsOfFile:imagePath];
    return [UIImage imageWithData:dataimage];
}


+ (UIImage *) setImageOriginal:(NSString *) imageName
{
   return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

// 设置阴影
+ (void) setviewlayer:(UIView *) viewName
{
    viewName.layer.shadowOpacity = 1;
    viewName.layer.shadowRadius = 5;
}


@end
