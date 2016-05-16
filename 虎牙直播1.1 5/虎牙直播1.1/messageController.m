//
//  messageController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "messageController.h"
#import "allTopController.h"
#import "friendCell.h"
@interface messageController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *meImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableVeiw;


@end

@implementation messageController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  设置 tabBar 图标为原色
    self.tabBarItem.image = [UIImage setImageOriginal:@"icon_tab_3_normal"];
    self.tabBarItem.selectedImage = [UIImage setImageOriginal:@"icon_tab_3_selected"];
   
    [self.meImageView setImageViewLayer];
    self.meImageView.image = [UIImage returdataImage];
}

-(void)viewWillAppear:(BOOL)animated{
    self.meImageView.image = [UIImage returdataImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ------ 数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    friendCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"friendCell" owner:nil options:nil].lastObject;
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"主播";
    }else
    {
        return @"好友";
    }
}


@end
