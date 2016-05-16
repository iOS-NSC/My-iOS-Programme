//
//  ViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "allTopController.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *titleNa;
// 直播
@property (weak, nonatomic) IBOutlet UICollectionView *viewShowVCD;
// 直播头
@property (weak, nonatomic) IBOutlet UIScrollView *TouScrollView;
//模型数据
@property (nonatomic,strong) NSArray *TouModel;

@property (nonatomic,weak) UIButton *tempButton;
@property (nonatomic,assign) CGFloat tempW;
@property (nonatomic,strong) showCD *show;
// ---------------
@property (nonatomic,assign) CGFloat tempButtonX;
@property (nonatomic,assign) CGFloat tempButtonW;

@property (nonatomic,strong) UIRefreshControl *refresh;
@property (nonatomic,assign) CGFloat x;

@property (nonatomic,assign) CGFloat cellY;

@property (weak, nonatomic) IBOutlet UIImageView *meImageView;


@property (nonatomic,strong) NSArray *directTelecastModel;

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";


-(NSArray *)directTelecastModel
{
    if (!_directTelecastModel) {
        _directTelecastModel = [directTelecastModel returnModel];
    }
    return _directTelecastModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    数据测试完毕
//    NSLog(@"%@",self.directTelecastModel);

    
    
   self.meImageView.image = [UIImage returdataImage];
    
    self.x = 100;
    self.tabBarItem.selectedImage = [UIImage setImageOriginal:@"icon_tab_0_selected-1"];
    self.tabBarItem.image = [UIImage setImageOriginal:@"icon_tab_0_normal副本"];
    [self.tabBarItem settitlEColor];
    
    [self.meImageView setImageViewLayer];
    self.viewShowVCD.delegate = self;
    
//     设置 直播 头部的button

    [self setToButton:self.directTelecastModel andAddVIew:self.TouScrollView];
    [self setviewlayer:self.titleNa];
 
}



-(void)viewWillAppear:(BOOL)animated{
     self.meImageView.image = [UIImage returdataImage];
}

// 设置阴影
- (void) setviewlayer:(UIView *) viewName
{
    viewName.layer.shadowOpacity = 1;
    viewName.layer.shadowRadius = 5;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 动态创建 button
- (void) setToButton:(NSArray *) allTopTitle andAddVIew:(UIScrollView *) topView
{
    int i = 0;
    for (directTelecastModel *name in allTopTitle) {
//  调用 button 的分类 设置 button的 frame
        UIButton *buttonName = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
        buttonName = [buttonName returnButton:name.name andX:self.tempButtonX andW:self.tempButtonW andButtonTag:i];
//  添加button
        [topView addSubview:buttonName];
        
        if (buttonName.tag == 0) {
            self.tempButton = buttonName;

        }
//  给button 添加点击事件
        [buttonName addTarget:self action:@selector(collsButton:) forControlEvents:(UIControlEventTouchUpInside)];
        topView.contentSize = CGSizeMake(buttonName.frame.origin.x + 100, 0);
      
        self.tempButtonW = buttonName.frame.size.width;
        self.tempButtonX = buttonName.frame.origin.x;
        i++;
    }

}
// 点击button 选中状态 换掉上一个button的选中状态
- (void) collsButton:(UIButton *) sender
{
//   设置当前点击的按钮为选中状态
    self.tempButton.selected = NO;
//   设置上一个按钮的点中状态 为不点中
    sender.selected = YES;

    if ([sender.superview isMemberOfClass:[self.TouScrollView class]]) {
//   点击让 viewShowVCD 集合视图 组头 置顶
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:sender.tag];
    
        if (sender.tag == 0 || sender.tag == 1) {
            self.x = sender.frame.origin.x;
        }
        
      [self GunDongFrameView:self.viewShowVCD andIndex:indexPath and:self.TouScrollView and: self.x and:sender];
    }
    self.tempButton = sender;

}


// 点击让 viewShowVCD 集合视图 组头 置顶
- (void) GunDongFrameView:(UICollectionView *) colletionView andIndex:(NSIndexPath *) index and:(UIScrollView *) scroll and:(CGFloat) x and:(UIButton *) button
{
    [colletionView selectItemAtIndexPath:index animated:YES scrollPosition:(UICollectionViewScrollPositionTop)];
//    自动滚动到 点击的button的位置
    [UIView animateWithDuration:0.5 animations:^{
        scroll.contentOffset = CGPointMake(button.frame.origin.x - x, 0);
    }];
}

#pragma mark --- 数据源
//第一问 有多少组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.directTelecastModel.count;
}
// 第一个问 每一组有多个元素
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    directTelecastModel *model =  self.directTelecastModel[section];
    
    return model.messages.count;
}

// 第三问 每个Cell 长什么样
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    showCD *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.AllModelMassage = [self modelMassage:indexPath.section and:indexPath.row];
    
    return cell;

}
//  获取 直播 plist 数据   设置到cell里面
- (messagesModel *) modelMassage:(NSInteger) section and:(NSInteger) row
{
    directTelecastModel *array = self.directTelecastModel[section];
    messagesModel *model = array.messages[row];
    return model;
}
// 点击某个cell  转换界面
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    bigScreenViewController *big = [[bigScreenViewController alloc] init];
    directTelecastModel *array = self.directTelecastModel[indexPath.section];
    messagesModel *model = array.messages[indexPath.row];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSArray *isDings = [NSArray arrayWithContentsOfFile:[path stringByAppendingPathComponent:@"DingYueAll"]];
    BOOL is = isDings[indexPath.row];
    big.perosnS = model.persons;
    big.isDing = is;
    big.index = indexPath.row;
    [self.tabBarController presentViewController:big animated:YES completion:nil];

}
// 组头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
//      直播 组头
    RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell" forIndexPath:indexPath];
        directTelecastModel *model = self.directTelecastModel[indexPath.section];
        headerView.title.text = model.name;
    reusableview = headerView;
        
    }
    
    return reusableview;
}


@end
