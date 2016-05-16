//
//  directTelecastModel.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "directTelecastModel.h"
#import "messagesModel.h"
@implementation directTelecastModel



- (instancetype) initWithDic:(NSDictionary *) dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.messages = [messagesModel returnArray:dic[@"messages"]];
    }
    return self;
}

+ (NSArray *) returnModel
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"directTelecast.plist" ofType:nil];
    NSArray *arrayModel = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dic in arrayModel) {
        directTelecastModel *model = [[directTelecastModel alloc] initWithDic:dic];
        [tempArray addObject:model];
        
    }
    return tempArray;
}


@end
