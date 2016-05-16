//
//  recreationModel.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "recreationModel.h"
#import "recreationMassage.h"
@implementation recreationModel


- (instancetype) initWithDic:(NSDictionary *) dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.recreation = [recreationMassage returnArray:dic[@"recreation"]];
    }
    return self;
}

+ (NSArray *) returnModel
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"recreation.plist" ofType:nil];
    NSArray *arrayModel = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dic in arrayModel) {
        recreationModel *model = [[recreationModel alloc] initWithDic:dic];
        [tempArray addObject:model];
        
    }
    return tempArray;
}
@end
