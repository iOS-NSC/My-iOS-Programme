//
//  messagesModel.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "messagesModel.h"

@implementation messagesModel
- (instancetype) initWithDic:(NSDictionary *) dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (NSArray *) returnArray:(NSArray *) model
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in model) {
        messagesModel *model = [[messagesModel alloc] initWithDic:dic];
        [tempArray addObject:model];
    }
    return tempArray;
}
@end
