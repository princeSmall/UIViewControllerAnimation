
//
//  MoveAnimationView.m
//  ViewControllerAnimation
//
//  Created by le tong on 2019/2/21.
//  Copyright © 2019 tong. All rights reserved.
//

#import "MoveAnimationView.h"

@implementation MoveAnimationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)moveCenterX:(CGFloat)x CenterY:(CGFloat)y{
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeTranslation(x,y);
    }];
}
- (void)moveToOrigin{
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

@end
