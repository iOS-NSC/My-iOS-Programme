//
//  YuLeViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "YuLeViewController.h"
#import "allTopController.h"
@interface YuLeViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
// 娱乐
@property (weak, nonatomic) IBOutlet UICollectionView *yuLeCollectionView;
// 娱乐 头
@property (weak, nonatomic) IBOutlet UIScrollView *yuLeScrollView;
//
@property (weak, nonatomic) IBOutlet UIView *yuLeBigView;
// 娱乐组头部
@property (nonatomic,strong) NSArray *yuLeTop;
// 娱乐 数据
@property (nonatomic,strong) NSArray *YuLeModel;

@property (weak, nonatomic) IBOutlet UIImageView *menImageView;


@property (nonatomic,weak) UIButton *tempButton;
@property (nonatomic,assign) CGFloat tempButtonX;
@property (nonatomic,assign) CGFloat tempButtonW;


@property (nonatomic,strong) NSArray *recreationModel;


@end

@implementation YuLeViewController

// 娱乐头部懒加载


-(NSArray *)recreationModel
{
    if (!_recreationModel) {
        _recreationModel = [recreationModel returnModel];
    }
    return _recreationModel;
}


- (void) viewDidLoad
{
    [super viewDidLoad];
//    
//    recreationModel *array = self.recreationModel;
//    NSMutableArray *mutabArray  =[ NSMutableArray array];
//    for (recreationModel *array in self.recreationModel) {
//        for (recreationMassage  *sss in array.recreation) {
//            BOOL block = NO;
//            [mutabArray addObject:@(block)];
//        }
//  
//    }
//    
//    BOOL sex = NO;
//
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *imagePath = [path stringByAppendingPathComponent:@"imageName"];
    
//    NSString *sexpath = [path stringByAppendingPathComponent:@"sex"];

//    NSString *namePath = [path stringByAppendingPathComponent:@"name"];
//    NSString *name =  @"空❤️、守心";
//    [name writeToFile:namePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
   
//    NSString *imageName1 =  @"me";
//    [imageName1 writeToFile:imagePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
//    
//    NSString *name1 = [NSString stringWithContentsOfFile:namePath encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"%@",name1);
//    
//    NSString *arrayPath = [path stringByAppendingPathComponent:@"DingYueAll"];
//    [mutabArray writeToFile:arrayPath atomically:YES];
//    NSLog(@"%@",[NSArray arrayWithContentsOfFile:arrayPath]);
//    
    

//  设置 tabbar 图标为原色

    self.tabBarItem.image = [UIImage setImageOriginal:@"icon_tab_1_normal"];
    self.tabBarItem.selectedImage = [UIImage setImageOriginal:@"icon_tab_1_selected"];
    [self.tabBarItem settitlEColor];
 
    self.menImageView.image = [UIImage imageNamed:[NSString stringWithContentsOfFile:imagePath encoding:NSUTF8StringEncoding error:nil]];
    self.menImageView.layer.cornerRadius = 23.5;
    self.menImageView.layer.masksToBounds = YES;
    
    
//  设置 娱乐 头部的button
    [self setToButton:self.recreationModel andAddVIew:self.yuLeScrollView];
    [self setviewlayer:self.yuLeBigView];
}

// 设置阴影
- (void) setviewlayer:(UIView *) viewName
{
    viewName.layer.shadowOpacity = 1;
    viewName.layer.shadowRadius = 5;
}

// 动态创建 button
- (void) setToButton:(NSArray *) allTopTitle andAddVIew:(UIScrollView *) topView
{
    int i = 0;
    for (recreationModel *name in allTopTitle) {
        
    UIButton *buttonName = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.tempButtonX += 10;

    buttonName = [buttonName returnButton:name.name andX:self.tempButtonX andW:self.tempButtonW andButtonTag:i];
        
//  添加button
    [topView addSubview:buttonName];
        
    if (buttonName.tag == 0) {
        self.tempButton = buttonName;

    }
//  给button 添加点击事件
    [buttonName addTarget:self action:@selector(collsButton:) forControlEvents:(UIControlEventTouchUpInside)];
        
    self.tempButtonW = buttonName.frame.size.width;
    self.tempButtonX = buttonName.frame.origin.x;
    i++;
        
    }
    
}

// 点击button 选中状态 换掉上一个button的选中状态
- (void) collsButton:(UIButton *) sender
{
    
//  设置当前点击的按钮为选中状态
    self.tempButton.selected = NO;
//  设置上一个按钮的点中状态 为不点中
    sender.selected = YES;

// 点击让 viewShowVCD 集合视图 组头 置顶
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:sender.tag];
    
    [self GunDongFrameView:self.yuLeCollectionView andIndex:indexPath];

    self.tempButton = sender;
    
    
}

// 点击让 viewShowVCD 集合视图 组头 置顶
- (void) GunDongFrameView:(UICollectionView *) colletionView andIndex:(NSIndexPath *) index
{
    [colletionView selectItemAtIndexPath:index animated:YES scrollPosition:(UICollectionViewScrollPositionTop)];
 
}

// 三 问
#pragma mark --- 数据源
//第一问 有多少组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   return self.recreationModel.count;
}

// 第一个问 每一组有多个元素
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return 4;
}

// 第三问 每个Cell 长什么样
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    YuleCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell1.YuLePlistModel = [self YuLeModelMassage:indexPath.section and:indexPath.row];
    return cell1;
    
}

//  获取 直播 plist 数据   设置到cell里面
- (recreationMassage *) YuLeModelMassage:(NSInteger) section and:(NSInteger) row
{
    recreationModel *array = self.recreationModel[section];
    recreationMassage *model = array.recreation[row];
    return model;
}

// 点击某个cell  转换界面
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    bigScreenViewController *big = [[bigScreenViewController alloc] init];
    recreationModel *array = self.recreationModel[indexPath.section];
    recreationMassage *model = array.recreation[indexPath.row];
    big.perosnS = model.persons;
    [self.tabBarController presentViewController:big animated:YES completion:nil];
    
}

// 组头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        
    RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell" forIndexPath:indexPath];
        recreationModel *model = self.recreationModel[indexPath.section];
        headerView.title.text = model.name;
        reusableview = headerView;
        
    }
    return reusableview;
    
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = (UIViewController *) segue;
    
    if ([vc isKindOfClass:[meTableViewController class]]) {
        meTableViewController *meVC = (meTableViewController *)vc;
        meVC.meImages = self.menImageView.image;
    }
}





@end
