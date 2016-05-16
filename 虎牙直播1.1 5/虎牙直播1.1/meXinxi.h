//
//  meXinxi.h
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageName)(UIImage *,NSString *);

@interface meXinxi : UITableViewController

@property (nonatomic,strong) ImageName imager;


@property (nonatomic,strong) UIImage *meImageView;

@property (nonatomic,strong) NSString *MeSetName;

@end
