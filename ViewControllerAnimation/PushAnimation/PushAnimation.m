//
//  PushAnimation.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/21.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

+ (void)pushView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType{
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = subType;
    [View.layer addAnimation:transition forKey:@"pushTransitionAnimation"];
    [View addSubview:subView];
}
+ (void)popView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = subType;
    [View.superview.layer addAnimation:transition forKey:@"popTransitionAnimation"];
    [subView removeFromSuperview];
}

@end
