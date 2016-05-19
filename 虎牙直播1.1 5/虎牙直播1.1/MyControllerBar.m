//
//  MyControllerBar.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyControllerBar.h"

@implementation MyControllerBar

-(instancetype)init
{
    if (self  = [super init]) {
        //配置导航栏
        //右侧
        UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithTitle:@"title_btn_search_p" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonClick)];
        

        self.rightBarButtonItems = @[rightItem1];
        //左边
//        UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:nil action:nil];
        
        //创建UIImage 对象,并设置图片的渲染样式始终使用原色，不受父视图的tintColor影响
        UIImage *image = [[UIImage imageNamed:@"button_channel_spam_shield_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
        self.leftBarButtonItem = leftItem2;
        
            UIView *titleView = [[UIView alloc]init];
            titleView.frame = CGRectMake(0, 0, 40, 30);
            titleView.backgroundColor = [UIColor orangeColor];
//            titleView 会自动居中显示
            self.titleView = titleView;
//        self. = @[leftItem1, leftItem2];
        
//        修改左右 按键的颜色，
//        self.tintColor = [UIColor greenColor];
        
        //中间
        self.title = @"直播";
    }
    return self;
}

- (void) barButtonClick
{
    
}



@end
