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
@property (nonatomic,strong)ScaleAnimationView * orangeView;
@property (nonatomic,strong)ScaleAnimationView * purpleView;
@property (nonatomic,strong)ScaleAnimationView * blueView;
@property (nonatomic,strong)ScaleAnimationView * yellowView;

@end

@implementation ScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.orangeView];
    [self.view addSubview:self.purpleView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.blueView];
    // Do any additional setup after loading the view.
}
- (ScaleAnimationView *)orangeView{
    if (_orangeView == nil) {
        _orangeView = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(250, 400, 100, 100)];
        _orangeView.backgroundColor = [UIColor orangeColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orangeScale)];
        [_orangeView addGestureRecognizer:tapGesture];
    }
    return _orangeView;
}
- (ScaleAnimationView *)purpleView{
    if (_purpleView == nil) {
        _purpleView = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(50, 400, 100, 100)];
        _purpleView.backgroundColor = [UIColor purpleColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(purpleScale)];
        [_purpleView addGestureRecognizer:tapGesture];
    }
    return _purpleView;
}
- (ScaleAnimationView *)blueView{
    if (_blueView == nil) {
        _blueView = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(50, 200, 100, 100)];
        _blueView.backgroundColor = [UIColor blueColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blueScale)];
        [_blueView addGestureRecognizer:tapGesture];
    }
    return _blueView;
}
- (ScaleAnimationView *)yellowView{
    if (_yellowView == nil) {
        _yellowView = [[ScaleAnimationView alloc]initWithFrame:CGRectMake(250, 200, 100, 100)];
        _yellowView.backgroundColor = [UIColor yellowColor];
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yellowScale)];
        [_yellowView addGestureRecognizer:tapGesture];
    }
    return _yellowView;
}
- (void)orangeScale{
    [self.orangeView scaleView:self.orangeView CGFloatX:250 CGFloatY:400 CGFloatW:100 CGFloatH:100];
}
- (void)purpleScale{
    [self.purpleView scaleView:self.purpleView CGFloatX:50 CGFloatY:400 CGFloatW:100 CGFloatH:100];
}
- (void)blueScale{
    [self.blueView scaleView:self.blueView CGFloatX:50 CGFloatY:200 CGFloatW:100 CGFloatH:100];
}
- (void)yellowScale{
    [self.yellowView scaleView:self.yellowView CGFloatX:250 CGFloatY:200 CGFloatW:100 CGFloatH:100];
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
