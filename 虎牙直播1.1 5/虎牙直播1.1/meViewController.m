//
//  meViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "meViewController.h"
#import "allTopController.h"

@interface meViewController ()

@end

@implementation meViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarItem.image = [UIImage setImageOriginal:@"icon_tab_3_normal"];
    self.tabBarItem.selectedImage = [UIImage setImageOriginal:@"icon_tab_3_selected"];
    [self.tabBarItem settitlEColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
