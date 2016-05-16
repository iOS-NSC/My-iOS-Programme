//
//  recreationModel.h
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface recreationModel : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray *recreation;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (NSArray *) returnModel;



@end
