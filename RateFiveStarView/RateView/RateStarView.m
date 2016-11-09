//
//  RateStarView.m
//  RateFiveStarView
//
//  Created by wentian on 16/11/9.
//  Copyright © 2016年 wentian. All rights reserved.
//

#import "RateStarView.h"

@implementation RateStarView

- (instancetype)initWithNormalImage:(UIImage*)starImage selectedImage:(UIImage*)selectedImage padding:(CGFloat)padding {
    if (self = [super init]) {
        for (int i = 0; i < 5; i++) {
            
            UIImageView *grayStarView = [[UIImageView alloc] initWithFrame:CGRectMake((starImage.size.width + padding)*i, 0, starImage.size.width, starImage.size.height)];
            grayStarView.image = starImage;
            [self addSubview:grayStarView];
            
            UIImageView *starView = [[UIImageView alloc] initWithFrame:CGRectMake((starImage.size.width + padding)*i, 0, starImage.size.width, starImage.size.height)];
            starView.image = selectedImage;
            starView.tag = 100 + i;
            [self addSubview:starView];
        }
        
        self.bounds = CGRectMake(0, 0, starImage.size.width * 5 + padding * 4, starImage.size.height);
    }
    
    return self;
}

- (void)setScore:(float)score {
    _score = score;
    int sc = (int)score;
    
    for (int i = 0; i < 5; i++) {
        UIImageView *starView = (UIImageView*)[self viewWithTag:100+i];
        if (i < sc) {
            CGRect rc = starView.frame;
            rc.size = starView.image.size;
            starView.frame = rc;
            CGRect contentFrame = CGRectMake(0, 0, 1, 1);
            starView.layer.contentsRect = contentFrame;
        }else if(i == sc && score - sc > 0.001){
            CGRect rc = starView.frame;
            rc.size.width = rc.size.width * (score - sc);
            starView.frame = rc;
            CGRect contentFrame = CGRectMake(0, 0, score - sc, 1);
            starView.layer.contentsRect = contentFrame;
        }else{
            CGRect rc = starView.frame;
            rc.size = starView.image.size;
            starView.frame = rc;
            CGRect contentFrame = CGRectMake(0, 0, 0, 0);
            starView.layer.contentsRect = contentFrame;
        }
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    for (int i = 0; i < 5; i++) {
        UIImageView *starView = (UIImageView*)[self viewWithTag:100+i];
        
        if (CGRectContainsPoint(starView.frame, point)) {
            [self setScore:i+1];
            break;
        }
    }
}

@end
