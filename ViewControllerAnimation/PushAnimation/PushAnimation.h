//
//  PushAnimation.h
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/21.
//  Copyright © 2017年 tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PushAnimation : NSObject

+ (void)pushView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType;

+ (void)popView:(UIView *)View subView:(UIView *)subView AndAnimationType:(NSString *)type AndsubType:(NSString *)subType;

@end
