//
//  ViewController.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/20.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ViewControllerAnimation.h"
#import "PresentViewController.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"
#import "PushGreenViewController.h"
#import "PushRedViewController.h"
#import "PushAnimation.h"
#import "ScaleViewAnimation/ScaleViewController.h"


@interface ViewControllerAnimation ()<UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)PresentAnimation * present;
@property (nonatomic,strong)DismissAnimation * dismiss;
@property (nonatomic,strong)PushGreenViewController * pushGVC;
@property (nonatomic,strong)PushRedViewController * pushRVC;
@property (nonatomic,strong)ScaleViewController * scaleVC;
@property (nonatomic,strong)UITableView * animationTableView;
@property (nonatomic,strong)NSArray * animationArray;

@end

@implementation ViewControllerAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ViewControllerAnimation";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"右翻页" style:UIBarButtonItemStyleDone target:self action:@selector(right)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"左翻页" style:UIBarButtonItemStyleDone target:self action:@selector(left)];
    self.pushGVC = [[PushGreenViewController alloc]init];
    self.pushRVC = [[PushRedViewController alloc]init];
    self.scaleVC = [[ScaleViewController alloc]init];
    
    [self.view addSubview:self.animationTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (UITableView *)animationTableView {
    if (_animationTableView == nil) {
        _animationTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _animationTableView.delegate = self;
        _animationTableView.dataSource = self;
    }
    return _animationTableView;
}
- (NSArray *)animationArray{
    if (_animationArray == nil) {
        _animationArray = [NSArray arrayWithObjects:@"PresentViewController",@"PushViewController",@"ScaleAnimationView",@"",@"", nil];
    }
    return _animationArray;
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
- (void)left{
    if (self.view.subviews.count == 0) {
        NSLog(@"none");
    }else if (self.view.subviews.count == 1){
        [PushAnimation popView:self.view subView:self.pushGVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromLeft];
    }else{
        [PushAnimation popView:self.view subView:self.pushRVC.view AndAnimationType:@"cube" AndsubType:kCATransitionFromLeft];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"identifierCell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        PresentViewController * presentVC = [[PresentViewController alloc]init];
        presentVC.transitioningDelegate = self;
        [self presentViewController:presentVC animated:YES completion:nil];
    }else if (indexPath.row == 1){
        [self right];
    }else if (indexPath.row == 2){
        [self.navigationController pushViewController:self.scaleVC animated:YES];
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
