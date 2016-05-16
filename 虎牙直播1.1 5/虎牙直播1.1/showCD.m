//
//  showCD.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "showCD.h"
#import "messagesModel.h"
#import "allTopController.h"
@interface showCD ()
/**
 *  主播名字
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 *  人数
 */
@property (weak, nonatomic) IBOutlet UILabel *persons;
/**
 *  游戏名称
 */
@property (weak, nonatomic) IBOutlet UILabel *game;

/**
 *  主播图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *directTelecastImageView;

@end

@implementation showCD

static NSMutableDictionary *mutableDic;

// 重写数据的setter 方法 赋值
- (void)setAllModelMassage:(messagesModel *)AllModelMassage
{
    _AllModelMassage = AllModelMassage;
    
    self.name.text = AllModelMassage.name;
    self.game.text = AllModelMassage.gameName;
    self.persons.text = [NSString stringWithFormat:@"%@",AllModelMassage.persons];
    [self.directTelecastImageView sd_setImageWithURL:[NSURL URLWithString:AllModelMassage.imageName]];
}

@end
