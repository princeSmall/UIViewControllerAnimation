//
//  PresentViewController.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/20.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "PresentViewController.h"
#import "ScaleAnimationView.h"

@interface PresentViewController ()
@property (nonatomic,strong)UIButton * backBtn;

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backBtn];
   
    // Do any additional setup after loading the view.
}
- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2.0-60, 50, 120, 60)];
        _backBtn.backgroundColor = [UIColor redColor];
        [_backBtn setTitle:@"点我返回" forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)dismiss{
     [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
