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

//@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (weak, nonatomic) IBOutlet UIButton *barButton;

@property (nonatomic,weak) UIButton *tempButton;

@property (nonatomic,assign) CGFloat tempW;


@property (nonatomic,strong) showCD *show;


@property (nonatomic,assign) CGFloat tempButtonX;
@property (nonatomic,assign) CGFloat tempButtonW;

@property (nonatomic,strong) NSArray *allMassage;



@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";



-(NSArray *)allMassage
{
    if (!_allMassage) {
        _allMassage = [directTelecastModel returnModel];
    }
    return _allMassage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.barButton setBackgroundImage: [UIImage returdataImage] forState:(UIControlStateNormal)];
    self.barButton.layer.cornerRadius = self.barButton.bounds.size.width * 0.5;
    self.barButton.layer.masksToBounds = YES;

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"button_update_tip_hover"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = NO;
    
    self.viewShowVCD.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.viewShowVCD.mj_header endRefreshing];

    }];

    
    self.viewShowVCD.collectionViewLayout = [[MyLayout alloc] init];
    //设置导航条 样式
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [self setviewlayer:self.TouScrollView];
    self.viewShowVCD.delegate = self;
    

//     设置 直播 头部的button
    [self setToButton:self.allMassage andAddVIew:self.TouScrollView];
    
    
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
        
        UIButton *buttonName = [UIButton buttonWithType:(UIButtonTypeCustom)];

        buttonName = [buttonName returnButton:name.name andX:self.tempButtonX andW:self.tempButtonW andButtonTag:i];
        
//        添加button
        [topView addSubview:buttonName];
        
////        设置button
//        buttonName.tag = i;
//        
        if (buttonName.tag == 0) {
            self.tempButton = buttonName;
//            buttonName.selected = YES;
        }
//        给button 添加点击事件
        [buttonName addTarget:self action:@selector(collsButton:) forControlEvents:(UIControlEventTouchUpInside)];
        
        topView.contentSize = CGSizeMake(buttonName.frame.origin.x + 100, 0);
  
        i++;
        self.tempButtonW = buttonName.frame.size.width;
        self.tempButtonX = buttonName.frame.origin.x;

    }

}

// 点击button 选中状态 换掉上一个button的选中状态
- (void) collsButton:(UIButton *) sender
{
    
    //    设置当前点击的按钮为选中状态
    self.tempButton.selected = NO;
    //    设置上一个按钮的点中状态 为不点中
    sender.selected = YES;
    
    CGFloat x = 100;
    
    if ([sender.superview isMemberOfClass:[self.TouScrollView class]]) {

        // 点击让 viewShowVCD 集合视图 组头 置顶
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:sender.tag];
        
        if (sender.tag == 0 || sender.tag == 1) {
            x = sender.frame.origin.x;
        }
      [self GunDongFrameView:self.viewShowVCD andIndex:indexPath and:self.TouScrollView and:x and:sender];
        
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

        return self.allMassage.count;

}
// 第一个问 每一组有多个元素
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    directTelecastModel *array = self.allMassage[section];
    return array.messages.count;
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
      directTelecastModel *array = self.allMassage[section];
    messagesModel *model = array.messages[row];
    return model;
}

// 点击某个cell  转换界面
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   bigScreenViewController *big = [[bigScreenViewController alloc] init];

    directTelecastModel *array = self.allMassage[indexPath.section];
    messagesModel *model = array.messages[indexPath.row];
        big.perosnS = model.persons;
    [self.tabBarController presentViewController:big animated:YES completion:nil];

}


// 组头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
    
//      直播 组头
    RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cell" forIndexPath:indexPath];
    directTelecastModel *model  = self.allMassage[indexPath.section];
        
    headerView.title.text = model.name;
        
    reusableview = headerView;
        
    }

    return reusableview;

}

-(void)viewWillAppear:(BOOL)animated{
    [self.barButton setBackgroundImage: [UIImage returdataImage] forState:(UIControlStateNormal)];
}



@end
