//
//  tabbarController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "tabbarController.h"
#import "allTopController.h"
@interface tabbarController ()

@property (nonatomic,strong) NSArray *tabBarItem;

@end

@implementation tabbarController


- (NSArray *) tabBarItem
{
    if (!_tabBarItem) {
        NSString *path  =[[NSBundle mainBundle] pathForResource:@"tabBarItem.plist" ofType:nil];
        _tabBarItem  =[NSArray arrayWithContentsOfFile:path];
    }
    return _tabBarItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        NSDictionary *dic = self.tabBarItem[i];
        [vc.tabBarItem settitlEColor];
        vc.tabBarItem.image = [UIImage setImageOriginal:dic[@"image"]];
        vc.tabBarItem.selectedImage = [UIImage setImageOriginal:dic[@"selectedImage"]];
    }
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
