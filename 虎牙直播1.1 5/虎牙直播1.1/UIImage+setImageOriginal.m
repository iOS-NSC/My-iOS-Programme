//
//  UIImage+setImageOriginal.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImage+setImageOriginal.h"

@implementation UIImage (setImageOriginal)

+ (UIImage *) setImageOriginal:(NSString *) imageName
{
   return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}
@end
