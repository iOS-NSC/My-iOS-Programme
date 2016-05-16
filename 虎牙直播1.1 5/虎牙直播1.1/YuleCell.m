//
//  YuleCell.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "YuleCell.h"
#import "recreationMassage.h"
#import "allTopController.h"
@interface YuleCell ()

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (weak, nonatomic) IBOutlet UIImageView *recreationImageView;

@property (weak, nonatomic) IBOutlet UILabel *persons;
@end

@implementation YuleCell


-(void)setYuLePlistModel:(recreationMassage *)YuLePlistModel
{
    _YuLePlistModel = YuLePlistModel;
    self.name.text = YuLePlistModel.name;
    self.gameName.text = YuLePlistModel.gameName;
    self.persons.text = [NSString stringWithFormat:@"%@", YuLePlistModel.persons];
    [self.recreationImageView sd_setImageWithURL:[NSURL URLWithString:YuLePlistModel.imageName]];
}





@end
