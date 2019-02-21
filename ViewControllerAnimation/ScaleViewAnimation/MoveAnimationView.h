//
//  MoveAnimationView.h
//  ViewControllerAnimation
//
//  Created by le tong on 2019/2/21.
//  Copyright © 2019 tong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoveAnimationView : UIView
- (void)moveCenterX:(CGFloat)x CenterY:(CGFloat)y;
- (void)moveToOrigin;
@end

NS_ASSUME_NONNULL_END
