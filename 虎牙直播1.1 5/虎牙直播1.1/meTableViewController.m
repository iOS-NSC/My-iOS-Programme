//
//  meTableViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "meTableViewController.h"
#import "allTopController.h"
@interface meTableViewController ()
// 图像
@property (weak, nonatomic) IBOutlet UITableViewCell *meImage;
// 我的订阅
@property (weak, nonatomic) IBOutlet UITableViewCell *meDingYue;
//我看过的
@property (weak, nonatomic) IBOutlet UITableViewCell *meLook;
// 我要开播
@property (weak, nonatomic) IBOutlet UITableViewCell *meKaiBo;
// 我的直播
@property (weak, nonatomic) IBOutlet UITableViewCell *meZhiBo;
//设置
@property (weak, nonatomic) IBOutlet UITableViewCell *set;
// 我的 头像
@property (weak, nonatomic) IBOutlet UIImageView *TOP;
// 主播的头像
@property (weak, nonatomic) IBOutlet UIImageView *HuYaImage;

@property (nonatomic,strong) meXinxi *men;
@property (nonatomic,strong) NSArray *tempModel;
//我的昵称
@property (weak, nonatomic) IBOutlet UILabel *myName;


@end

/************************************************/
@implementation meTableViewController

//懒加载
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *imagePath = [path stringByAppendingPathComponent:@"imageName"];
    
    self.TOP.image = [UIImage imageNamed:[NSString stringWithContentsOfFile:imagePath encoding:NSUTF8StringEncoding error:nil]];
    self.myName.text = [NSString stringWithContentsOfFile:[path stringByAppendingPathComponent:@"name"] encoding:NSUTF8StringEncoding error:nil];
    
    
    
    
//    self.TOP.image = self.meImages;
    self.tableView.userInteractionEnabled = YES;
//  设置头像圆形
    [self.TOP setYuan:self.TOP];
    [self.HuYaImage setYuan:self.HuYaImage];
    
}

- (IBAction)returnUPVC:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




// 点击已经订阅的主播跳转
- (IBAction)GoBigView:(UITapGestureRecognizer *)sender {
    NSArray *array = self.tempModel[0];
    bigScreenViewController *big = [[bigScreenViewController alloc] init];
    [self  presentViewController:big animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data sourc
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 2;
        default:
            return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            
            return self.meImage;
            
        case 1:
            if (indexPath.row == 0) {
                
            return self.meDingYue;
                
            }else
            {
                
            return self.meLook;
                
            }
        case 2:
            if (indexPath.row == 0) {
                
            return self.meKaiBo;
                
            }else
            {
                
            return self.meZhiBo;
                
            }
        default:
            return self.set;
            break;
           
    }

}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    第三组的
    if (indexPath.section == 2) {
//         打开相机
        [self xuanZeXiangji:UIImagePickerControllerSourceTypeCamera];
    }
  
}
//   打开相机
- (void) xuanZeXiangji:(UIImagePickerControllerSourceType) type
{
//    创建 图片编辑器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = type;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    取出目标控制器
    UIViewController *vc = segue.destinationViewController;

//    判断目标VC 是否 是修改界面
    if ([vc isKindOfClass:[meXinxi class]]) {
        meXinxi *me = (meXinxi*)vc;
        me.imager = ^ (UIImage *imagename,NSString *name)
        {
            self.myName.text = name;
            self.TOP.image = imagename;
        };
        me.meImageView = self.TOP.image;
        me.MeSetName = self.myName.text;
    }
}




@end
