//
//  LookNavigationController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LookNavigationController.h"
#import "allTopController.h"
@interface LookNavigationController ()


@end

@implementation LookNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

//  设置 tabBar 图标为原色
    self.tabBarItem.image = [UIImage setImageOriginal:@"icon_tab_2_normal"];
    self.tabBarItem.selectedImage = [UIImage setImageOriginal:@"icon_tab_2_selected"];
    [self.tabBarItem settitlEColor];

}


@end
