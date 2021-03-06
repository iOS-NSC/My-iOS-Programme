//
//  MyLayout.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout

-(instancetype)init
{
    if (self  = [super init]) {
//        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width * 0.5 - 1;
        self.itemSize = CGSizeMake(cellW, 130);
        self.minimumLineSpacing = 3;
        self.minimumInteritemSpacing = 0;
        self.headerReferenceSize = CGSizeMake(cellW, 40);
        self.sectionInset = UIEdgeInsetsMake(0, 0, 2, 0);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return self;
}

@end
