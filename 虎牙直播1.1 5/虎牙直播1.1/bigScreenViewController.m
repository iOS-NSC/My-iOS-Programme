//
//  bigScreenViewController.m
//  虎牙直播1.1
//
//  Created by tarena04 on 16/5/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "bigScreenViewController.h"
#import "allTopController.h"
@interface bigScreenViewController ()<UITextFieldDelegate>

// 滑动视图
@property (weak, nonatomic) IBOutlet UIScrollView *NeiRongView;
//文本框
@property (weak, nonatomic) IBOutlet UITextField *textFile;
// 聊天框 底部View
@property (weak, nonatomic) IBOutlet UIView *footView;
// 视频
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIView *footAndPerson;
// 视频加载
@property (weak, nonatomic) IBOutlet UIImageView *animationImageView;

@property (weak, nonatomic) IBOutlet UILabel *jiaZaiLabel;
// 全屏编辑  是否显示
@property (weak, nonatomic) IBOutlet UIButton *Bianji;

// 临时变量 记录 全屏之前 的 View
@property (nonatomic,assign) CGRect bigImage;
@property (nonatomic,assign) CGRect top;
@property (nonatomic,assign) CGRect foor;

// 临时按钮 记录上一个按钮的选中状态
@property (nonatomic,strong) UIButton *tempButton;

@property (weak, nonatomic) IBOutlet UILabel *personLabel;
// 信息栏
@property (weak, nonatomic) IBOutlet UIView *MassageView;
// 订阅
@property (weak, nonatomic) IBOutlet UIButton *isDingYUE;

@end

/***************************************************************/
@implementation bigScreenViewController
static int i = 0;

// 主
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textFile.delegate = self;
    self.top = self.topView.frame;
    self.bigImage = self.animationImageView.frame;
    self.foor = self.footAndPerson.frame;
    
    self.isDingYUE.selected = self.isDing;
    NSLog(@"%d",self.isDing);
    self.personLabel.text = [NSString stringWithFormat:@"%@",self.perosnS];
    
    //    视频加载 动画
    [self animatedImage];
    //    定时隐藏
    [self TopAndWei];
    
    //订阅通知  退出键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
}
- (IBAction)DingYue:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSMutableArray *isDings = [[NSArray arrayWithContentsOfFile:[path stringByAppendingPathComponent:@"DingYueAll"]] mutableCopy];

    BOOL isDing = isDings[self.index];
    isDing = !sender.selected;
    isDings[self.index] = @(isDing);
    [isDings writeToFile:@"DingYueAll" atomically:YES];
    NSLog(@"%@",isDings);
}
// 点击隐藏 视频的边栏
- (IBAction)topAndFoot:(id)sender {
//    隐藏 返回按钮
    self.topView.hidden = !self.topView.hidden;
    self.footAndPerson.hidden = !self.footAndPerson.hidden;
//    定时隐藏
    [self TopAndWei];

}
//
- (IBAction)scrollButton:(UIButton *)sender {
    
    self.tempButton.selected = NO;
    sender.selected = !sender.selected;
    self.tempButton = sender;
    
}
// 点击全屏
- (IBAction)bigPing:(UIButton *)sender {
    CGRect viewFrame = self.view.frame;
    sender.selected = !sender.selected;
    self.bigImage = self.animationImageView.frame;
    
    if (sender.selected == YES) {
        
        [UIView animateWithDuration:1 animations:^{
            self.animationImageView.frame = CGRectMake(-146, +146, viewFrame.size.height, viewFrame.size.width);
            self.footAndPerson.frame = CGRectMake(-146, +146, viewFrame.size.height, viewFrame.size.width);
            [self allBig:self.animationImageView];
            [self allBig:self.footAndPerson];
            
        }];
    }else
    {
        [UIView animateWithDuration:1 animations:^{
            self.animationImageView.frame = self.bigImage;
            self.footAndPerson.frame = self.bigImage;
            [self returnPing:self.animationImageView];
            [self returnPing:self.footAndPerson];
            
        }];
    }
    

   
}
// 全屏
- (void) allBig:(UIView *) transforms
{
   transforms.transform = CGAffineTransformMakeRotation(M_PI_2);
}
// 恢复原始屏幕
- (void) returnPing:(UIView *) transforms
{
    transforms.transform = CGAffineTransformMakeRotation(-M_PI*2);
}
// 全屏设置位置
- (void) bigPingFrame:(UIView *) setFrame andFrame:(CGRect) frame
{
    setFrame.frame = frame;
}
//返回
- (IBAction)returnVc:(UIButton *)sender {
//     结束 动画
    [self.animationImageView stopAnimating];
//     返回上一个View
    [self dismissViewControllerAnimated:YES completion:nil];
}
// text 文本框
- (IBAction)text:(UITextField *)sender {
    
    [self HuoQu:sender.text and:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self HuoQu:@"呵呵" and:NO];
    });
}

// 聊天窗口
-(void) HuoQu:(NSString *) titile and:(BOOL) zuo
{
    i++;
    TextView *NeiRong = [[TextView alloc] init];
    
    NeiRong.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    NeiRong.zuo = zuo;
    
    CGFloat neiViewH =  [NeiRong setLabel:titile];
    CGFloat xia = 613;
    neiViewH = neiViewH + 20;
    NeiRong.frame = CGRectMake(0, xia + (50 * i), self.view.frame.size.width, neiViewH + 10);

    [self.NeiRongView addSubview:NeiRong];
    
    [UIView animateWithDuration:0.5 animations:^{
        
      self.NeiRongView.contentOffset = CGPointMake(0, NeiRong.frame.origin.y);
      self.NeiRongView.contentSize = CGSizeMake(0,  NeiRong.frame.origin.y + 60);
   
    }];

    self.textFile.text = nil;
}

// 定时隐藏
- (void) TopAndWei
{
    if (self.topView.hidden == NO) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self topAndFoot:nil];
        });
    }
    
}


//    视频加载 动画
- (void) animatedImage
{
    UIImage *image = [UIImage animatedImageNamed:@"gif_video_loading@2x－" duration:1*0.5];
    self.animationImageView.image = image;
}

//键盘的位置或大小发生改变
- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect frame = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat offsetY = frame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.footView.transform = CGAffineTransformMakeTranslation(0, offsetY);
    }];
    
}
//退出键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //退出键盘
    [self.view endEditing:YES];
}

#pragma mark -- 文本框代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField becomeFirstResponder];
    return 1;
}



@end
