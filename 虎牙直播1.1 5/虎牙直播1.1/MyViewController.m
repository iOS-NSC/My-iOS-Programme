//
//  MyViewController.m
//  Demo1_导航栏
//
//  Created by tarena on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.navigationController.navigationBarHidden = YES;
    
    //由系统负责隐藏 底部的各种bar
    self.hidesBottomBarWhenPushed = YES;
//    self.navigationController.toolbarHidden = YES;
    
//    [self.navigationController pushViewController:[MyViewController2 new] animated:YES];
}


-(void)barButtonClick:(UIBarButtonItem*)sender {
    NSLog(@"rightButtonItem 被点中");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
   
    //配置导航栏
    //右侧
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonClick:)];
    
    
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(barButtonClick:)];
    self.navigationItem.rightBarButtonItems = @[rightItem1, rightItem2];
    //左边
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //创建UIImage 对象,并设置图片的渲染样式始终使用原色，不受父视图的tintColor影响
    UIImage *image = [[UIImage imageNamed:@"bg_role1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[leftItem1, leftItem2];
    
    //修改左右 按键的颜色，
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    
    //中间
    self.navigationItem.title = @"中间标题";
    
    
    
    //修改导航条的背景
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    //在导航条最前 有一个 图片视图 在盖着导航条， 只是这个图片视图是半透明的，如果需要设置背景色， 图片视图不能删除，但是我可以设置这个图片视图 是没有 任何实际图片的图片视图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    //设置导航条 不是 半透明状态
    self.navigationController.navigationBar.translucent = YES;
  
    
    //设置导航条 样式
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
    //设置工具栏
    //让 工具栏 显示出来
    self.navigationController.toolbarHidden = NO;
    
    UIBarButtonItem *toolbarIte1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil];
     UIBarButtonItem *toolbarIte2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:nil action:nil];
     UIBarButtonItem *toolbarIte3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:nil];
    //创建50长度的木棍
    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = 50;
    //创建100长度的木棍  创建木棍特效
    UIBarButtonItem *fixItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem2.width = 100;
    //创建弹簧特效
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[fixItem, toolbarIte1, fixItem2, toolbarIte2, flexibleItem , toolbarIte3, fixItem];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
