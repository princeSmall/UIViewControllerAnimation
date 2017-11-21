//
//  ScaleViewController.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/21.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ScaleViewController.h"
#import "ScaleAnimationView.h"

@interface ScaleViewController ()
@property (nonatomic,strong)ScaleAnimationView * scaleView;
@property (nonatomic,strong)ScaleAnimationView * scaleView1;

@end

@implementation ScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scaleView];
    [self.view addSubview:self.scaleView1];
    // Do any additional setup after loading the view.
}
- (ScaleAnimationView *)scaleView{
    if (_scaleView == nil) {
        _scaleView = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(250, 400, 100, 100)];
        _scaleView.backgroundColor = [UIColor orangeColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scale)];
        [_scaleView addGestureRecognizer:tapGesture];
    }
    return _scaleView;
}
- (ScaleAnimationView *)scaleView1{
    if (_scaleView1 == nil) {
        _scaleView1 = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(50, 400, 100, 100)];
        _scaleView1.backgroundColor = [UIColor purpleColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scale1)];
        [_scaleView1 addGestureRecognizer:tapGesture];
    }
    return _scaleView1;
}
- (void)scale{
    [self.scaleView scaleView:self.scaleView CGFloatX:250 CGFloatY:400 CGFloatW:100 CGFloatH:100];
}
- (void)scale1{
    [self.scaleView1 scaleView:self.scaleView1 CGFloatX:50 CGFloatY:400 CGFloatW:100 CGFloatH:100];
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
