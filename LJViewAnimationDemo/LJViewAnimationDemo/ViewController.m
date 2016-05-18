//
//  ViewController.m
//  LJViewAnimationDemo
//
//  Created by 罗金 on 16/5/18.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    // 黑色背景框
    UIView *_backView;
    // 放大缩小的图片
    UIImageView *_showImg;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)popImageView:(id)sender {
    // 创建一个黑色背景
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_backView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    [self.view.window addSubview:_backView];
    
    UIButton *closeQRBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-65, 15, 48, 48)];
    [closeQRBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeQRBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:closeQRBtn];
    
    
    // 初始化要显示的图片内容的imageView
    _showImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 283.5, 100, 100)];
    _showImg.backgroundColor = [UIColor orangeColor];
    [_backView addSubview:_showImg];
    [_showImg setImage:[UIImage imageNamed:@""]];
    
    [self shakeToShow:_backView];//放大过程中的动画
}

#pragma mark 缩小过程中出现的缓慢动画
-(void)closeView{
    [UIView animateWithDuration:0.2 animations:^{
        _backView.alpha = 0;
        _showImg.frame = CGRectMake(_showImg.center.x, _showImg.center.y, 0, 0);
    } completion:^(BOOL finished) {
        [_backView removeFromSuperview];
    }];
}

#pragma mark 放大过程中出现的缓慢动画
- (void) shakeToShow:(UIView*)aView {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
