//
//  messagesModel.h
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface messagesModel : NSObject
@property (nonatomic,strong) NSString *gameName;
@property (nonatomic,strong) NSNumber *persons;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *name;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (NSArray *) returnArray:(NSArray *) model;


@end
