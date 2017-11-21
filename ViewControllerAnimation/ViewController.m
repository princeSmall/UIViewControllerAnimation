//
//  ViewController.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/20.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"
#import "PushGreenViewController.h"
#import "PushRedViewController.h"
#import "PushAnimation.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)PresentAnimation * present;
@property (nonatomic,strong)DismissAnimation * dismiss;
@property (nonatomic,strong)PushGreenViewController * pushGVC;
@property (nonatomic,strong)PushRedViewController * pushRVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"右" style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(left)];
    self.pushGVC = [[PushGreenViewController alloc]init];
    self.pushRVC = [[PushRedViewController alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)right{
    if (self.view.subviews.count == 0) {
        [PushAnimation pushView:self.view subView:self.pushGVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromRight];
    }else if (self.view.subviews.count == 1){
        [PushAnimation pushView:self.view subView:self.pushRVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromRight];
    }else{
        NSLog(@"none");
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PresentViewController * presentVC = [[PresentViewController alloc]init];
    presentVC.transitioningDelegate = self;
    [self presentViewController:presentVC animated:YES completion:nil];
   
}
- (void)left{
    if (self.view.subviews.count == 0) {
        NSLog(@"none");
    }else if (self.view.subviews.count == 1){
        [PushAnimation popView:self.view subView:self.pushGVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromLeft];
    }else{
        [PushAnimation popView:self.view subView:self.pushRVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromLeft];
    }
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return (id)[[PresentAnimation alloc]init];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return (id)[[DismissAnimation alloc]init];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
