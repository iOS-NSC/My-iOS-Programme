//
//  recreationMassage.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "recreationMassage.h"

@implementation recreationMassage
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
        recreationMassage *model = [[recreationMassage alloc] initWithDic:dic];
        [tempArray addObject:model];
    }
    return tempArray;
}
@end
