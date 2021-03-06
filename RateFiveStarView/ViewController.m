//
//  ViewController.m
//  RateFiveStarView
//
//  Created by wentian on 16/11/9.
//  Copyright © 2016年 wentian. All rights reserved.
//

#import "ViewController.h"
#import "RateStarView.h"

@interface ViewController () {
    RateStarView *starView;
    UITextField *textField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    starView = [[RateStarView alloc] initWithNormalImage:[UIImage imageNamed:@"comment_score_unselected"] selectedImage:[UIImage imageNamed:@"comment_score_selected"] padding:5];
    
    starView.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:starView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 30);
    [button setTitle:@"获取star" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(getStarValue) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(starView.center.x, starView.center.y + 50);
    [self.view addSubview:button];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.center = CGPointMake(starView.center.x, starView.center.y + 100);
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textField];
}


- (void)textFieldDidChange:(id)sender {
    [starView setScore:textField.text.floatValue];
}

- (void)getStarValue {
    textField.text = [NSString stringWithFormat:@"%0.1f", starView.score];
}

@end
