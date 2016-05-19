//
//  GOViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "GOViewController.h"
#import "allTopController.h"
@interface GOViewController ()

@end

@implementation GOViewController

+ (UIButton *) setLeftNavigationBarButton
{
    
    //创建UIImage 对象,并设置图片的渲染样式始终使用原色，不受父视图的tintColor影响
    UIImage *image = [UIImage returdataImage];
    //    image = [UIImage setImageOriginal:image];
    UIButton *button  = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:image forState:(UIControlStateNormal)];
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    button.frame = CGRectMake(20, 0, 40, 40);
    
//    [button addTarget:self action:@selector(GotoMeView) forControlEvents:(UIControlEventTouchUpInside)];
    
    return button;
}


+ (UIButton *) setRightNavigationBarButton
{
    //配置导航栏
    CGRect frame = [UIScreen mainScreen].bounds;
    UIButton *button1  = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button1 setBackgroundImage:[UIImage imageNamed:@"title_btn_search_p"] forState:(UIControlStateNormal)];
    
    button1.frame = CGRectMake(frame.size.width - 50, 0, 40, 40);
    return button1;
}


//- (void) GotoMeView
//{
//    meTableViewController *me = [[meTableViewController alloc] init];
//    [self presentViewController:me animated:YES completion:nil];
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
