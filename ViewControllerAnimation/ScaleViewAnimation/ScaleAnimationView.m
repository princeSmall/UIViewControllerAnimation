//
//  ScaleAnimationView.m
//  ViewControllerAnimation
//
//  Created by tongle on 2017/11/21.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "ScaleAnimationView.h"

@implementation ScaleAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)scaleCGFloatX:(CGFloat)x CGFloatY:(CGFloat)y CGFloatW:(CGFloat)w CGFloatH:(CGFloat)h{
    CGFloat scaleW = self.window.frame.size.width / w;
    CGFloat scaleH = self.window.frame.size.height / h;
    CGFloat W = scaleW * 50 - 50 - x;
    CGFloat H = scaleH * 50 - 50 - y;
    [UIView animateWithDuration:1.0 animations:^{
        self.transform =CGAffineTransformConcat(CGAffineTransformMakeScale(scaleW, scaleH), CGAffineTransformMakeTranslation(W,H));
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.transform = CGAffineTransformIdentity;
        });
        
    }];
    
}

@end
