### ViewControllerAnimation
注：所有的动画我都封装起来了，拿了直接用即可，简单粗暴看代码，这里可以让你知其然，知其所以然。

#### PresentAnimation

实现UIViewControllerTransitioningDelegate的代理方法，把present从下面出来的view从右边动画出来，具体代码看github代码，具体方法如下：

<pre>
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

}
</pre>


<pre>
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return (id)[[PresentAnimation alloc]init];
}
</pre>

#### DismissAnimation

<pre>
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
  
  }
</pre>

<pre>
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return (id)[[DismissAnimation alloc]init];
}
</pre>


#### PushAnimation

动画添加新的view，type和subType不同，动画方式就不一样。这里只写一个不累赘
<pre>
+ (void)pushView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType{  
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = subType;
    [View.layer addAnimation:transition forKey:@"pushTransitionAnimation"];
    [View addSubview:subView];
}
</pre>
关于CATransition的type和subType的介绍，前两篇博客已经介绍过，这里有[github地址](https://github.com/princeSmall/Full-animation-details.git)

#### PopAnimation
动画移除新的view
<pre>
+ (void)popView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = subType;
    [View.superview.layer addAnimation:transition forKey:@"popTransitionAnimation"];
    [subView removeFromSuperview];
}
</pre>
关于CATransition的type和subType的介绍，前两篇博客已经介绍过，这里有[github地址](https://github.com/princeSmall/Full-animation-details.git)

#### ScaleViewAnimation

CGAffineTransform 主要用于形变，位移和旋转，可用于动画展示

##### transform属性介绍，这里介绍最常用和好用的，其他属性去看CGAffineTransform

* 位移X,Y

        CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
* 伸缩X,Y

        CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
* 旋转M_PI

        CGAffineTransformMakeRotation(CGFloat angle)

* 组合

        CGAffineTransformConcat(CGAffineTransform t1,CGAffineTransform t2)

* 回到原位

        CGAffineTransformIdentity
        

 ##### 动画调用，包括动画时间，动画完成后回调
 
        [UIView animateWithDuration:1.0 animations:^{
        
        view.transform =CGAffineTransformConcat(CGAffineTransformMakeScale(scaleW, scaleH), CGAffineTransformMakeTranslation(W,H));
        
          } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            view.transform = CGAffineTransformIdentity;
            
        });    
         }];