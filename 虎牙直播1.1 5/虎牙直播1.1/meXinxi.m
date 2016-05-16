//
//  meXinxi.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "meXinxi.h"
#import "allTopController.h"
@interface meXinxi ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
//头像
@property (weak, nonatomic) IBOutlet UITableViewCell *meImage;
//账户
@property (weak, nonatomic) IBOutlet UITableViewCell *ID;
//YY号
@property (weak, nonatomic) IBOutlet UITableViewCell *YYID;
//昵称
@property (weak, nonatomic) IBOutlet UITableViewCell *name;
//性别
@property (weak, nonatomic) IBOutlet UITableViewCell *sex;
//签名
@property (weak, nonatomic) IBOutlet UITableViewCell *signature;
//金币
@property (weak, nonatomic) IBOutlet UITableViewCell *jinBi;
//银币
@property (weak, nonatomic) IBOutlet UITableViewCell *yinBi;
//Y币
@property (weak, nonatomic) IBOutlet UITableViewCell *Ybi;
//头像图片
@property (weak, nonatomic) IBOutlet UIImageView *me;
//性别
@property (weak, nonatomic) IBOutlet UILabel *setSexLabel;

@property (nonatomic,strong) meTableViewController *UPiamgeView;

@property (weak, nonatomic) IBOutlet UITextField *UpName;
@end

@implementation meXinxi

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.me.image = self.meImageView;
    self.UpName.text = self.MeSetName;
//     设置头像圆形
    [self.me setYuan:self.me];
    BOOL sex =  [[NSUserDefaults standardUserDefaults] objectForKey:@"sex"];
    if (sex == YES) {
        self.setSexLabel.text = @"男";
    }else
    {
       self.setSexLabel.text = @"女";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setMeName:(UITextField *)sender {
    self.MeSetName = sender.text;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *imagePath = [path stringByAppendingPathComponent:@"name"];
    [sender.text writeToFile:imagePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    

}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else if (section == 1)
    {
        return 5;
    }else
    {
        return 3;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    switch (indexPath.section) {
        case 0:
            
            return self.meImage;
            
        case 1:
            if (indexPath.row == 0) {
                self.ID.userInteractionEnabled = NO;
                return self.ID;
                
            }else if (indexPath.row == 1)
            {
                self.YYID.userInteractionEnabled = NO;
                return self.YYID;
                
            }else if (indexPath.row == 2)
            {
                return self.name;
                
            }else if (indexPath.row == 3)
            {
                return self.sex;
                
            }else
            {
                return self.signature;
            }

        default:
            if (indexPath.row == 0) {
                return self.jinBi;
            }else if (indexPath.row == 1)
            {
                return self.yinBi;
            }else
            {
                return self.Ybi;
            }
    
    }
    
}

// 选中某一行做什么
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
//  打开相册  设置 头像
    [self xuanZeXiangji:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 3) {
            [self setSex];
        }
    }
    
    
    
}

//设置性别
- (void) setSex
{
//    创建 警告框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
//    创建意图按钮
    UIAlertAction *actionM = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.setSexLabel.text = @"男";
        BOOL sex = NO;
        [[NSUserDefaults standardUserDefaults] setObject:@(sex) forKey:@"sex"];
    }];
    UIAlertAction *actionH = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         self.setSexLabel.text = @"女";
        BOOL sex = YES;
        [[NSUserDefaults standardUserDefaults] setObject:@(sex) forKey:@"sex"];
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:( UIAlertActionStyleDestructive) handler:nil];
    
    [alert addAction:actionM];
    [alert addAction:actionH];
    [alert addAction:action];
    
//   显示
    [self presentViewController:alert animated:YES completion:nil];

}

//   打开相册
- (void) xuanZeXiangji:(UIImagePickerControllerSourceType) type
{
//   创建 图片编辑器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = type;
//  设置代理 （为了通过代理方法获取编辑完的图片）
    imagePicker.delegate = self;
//  允许编辑图片
    imagePicker.allowsEditing = YES;
//  打开图片编译器
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -- 图片编译器的代理方法
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
//  info 是字典 字典存的是 图片编译器给我的相关信息
//  通过 UIImagePickerController获取 字典中 保存的编辑完的图片
    UIImage *editImage = info[UIImagePickerControllerEditedImage];
//  修改头像的 image View 的image 为编辑完的图片
    NSLog(@"%@",editImage);
    self.me.image = editImage;
//    NSDictionary *name = info;
//    NSLog(@"%@",name);
    
//    NSData *data = UIImagePNGRepresentation(editImage);
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"imageView"];
//  编辑完成返回
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 传回编辑完成的图片
- (IBAction)returnVC:(UIButton *)sender {
    
    self.imager(self.me.image,self.MeSetName);
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
