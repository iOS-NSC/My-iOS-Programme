//
//  TextView.h
//  04-29-作业
//
//  Created by tarena04 on 16/5/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextView : UIView
// YES 自己 NO 别人
@property (nonatomic,assign) BOOL zuo;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) CGFloat GetY;


- (CGFloat) setLabel:(NSString *) title;

@end
