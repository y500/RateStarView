//
//  RateStarView.h
//  RateFiveStarView
//
//  Created by wentian on 16/11/9.
//  Copyright © 2016年 wentian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RateStarView : UIView
@property(nonatomic, assign)float score;

- (instancetype)initWithNormalImage:(UIImage*)starImage selectedImage:(UIImage*)selectedImage padding:(CGFloat)padding;

- (void)setScore:(float)score;

@end
