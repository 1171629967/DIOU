//
//  ChooseVC.m
//  DIOU
//
//  Created by 王 李鑫 on 14-8-22.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import "ChooseVC.h"
#import "WLXAppDelegate.h"
#import "AnimationHelper.h"
#import "SpaceVC.h"
#import "RoomVC.h"

#define ANIMATION_DURATION 0.5//预定义动画执行时间为0.5秒

@interface ChooseVC ()

@end

@implementation ChooseVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //延迟1秒后逐步出现几个圈圈
    [self performSelector:@selector(showCircle1) withObject:nil afterDelay:2.0];
    [self performSelector:@selector(showCircle2) withObject:nil afterDelay:2.3];
    [self performSelector:@selector(showCircle3) withObject:nil afterDelay:2.6];
    [self performSelector:@selector(showCircle4) withObject:nil afterDelay:2.9];
    [self performSelector:@selector(showCircle5) withObject:nil afterDelay:3.2];
    
    //依次给圈圈添加点击监听
    self.iv_circle1.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage1)];
    [self.iv_circle1 addGestureRecognizer:singleTap1];
    
    self.iv_circle2.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage2)];
    [self.iv_circle2 addGestureRecognizer:singleTap2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}







- (void)showCircle1
{
    CABasicAnimation *X_animation = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:0]];
    CABasicAnimation *Y_animation = [AnimationHelper moveYWithTime:ANIMATION_DURATION Y:[NSNumber numberWithFloat:-50]];
    CABasicAnimation *rotation = [AnimationHelper rotateWithTime:ANIMATION_DURATION ToRotateValue:[NSNumber numberWithFloat:3.1415926]];
    [self.iv_circle1.layer addAnimation:X_animation forKey:nil];
    [self.iv_circle1.layer addAnimation:Y_animation forKey:nil];
    //[self.iv_circle1.layer addAnimation:rotation forKey:nil];
    self.iv_circle1.hidden = NO;
}
- (void)showCircle2
{
    //第二个圈X轴位移动画
    CABasicAnimation *X_animation = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:61]];
    //第二个圈Y轴位移动画
    CABasicAnimation *Y_animation = [AnimationHelper moveYWithTime:ANIMATION_DURATION Y:[NSNumber numberWithFloat:-36]];
    CABasicAnimation *rotation = [AnimationHelper rotateWithTime:ANIMATION_DURATION ToRotateValue:[NSNumber numberWithFloat:3.1415926]];
    [self.iv_circle2.layer addAnimation:X_animation forKey:nil];
    [self.iv_circle2.layer addAnimation:Y_animation forKey:nil];
    //[self.iv_circle2.layer addAnimation:rotation forKey:nil];
    self.iv_circle2.hidden = NO;
}
- (void)showCircle3
{
    //第三个圈X轴位移动画
    CABasicAnimation *X_animation = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:58]];
    //第三个圈Y轴位移动画
    CABasicAnimation *Y_animation = [AnimationHelper moveYWithTime:ANIMATION_DURATION Y:[NSNumber numberWithFloat:40]];
    CABasicAnimation *rotation = [AnimationHelper rotateWithTime:ANIMATION_DURATION ToRotateValue:[NSNumber numberWithFloat:3.1415926]];
    [self.iv_circle3.layer addAnimation:X_animation forKey:nil];
    [self.iv_circle3.layer addAnimation:Y_animation forKey:nil];
    //[self.iv_circle3.layer addAnimation:rotation forKey:nil];
    self.iv_circle3.hidden = NO;
}
- (void)showCircle4
{
    //第四个圈X轴位移动画
    CABasicAnimation *X_animation = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-40]];
    //第四个圈Y轴位移动画
    CABasicAnimation *Y_animation = [AnimationHelper moveYWithTime:ANIMATION_DURATION Y:[NSNumber numberWithFloat:44]];
    CABasicAnimation *rotation = [AnimationHelper rotateWithTime:ANIMATION_DURATION ToRotateValue:[NSNumber numberWithFloat:3.1415926]];
    [self.iv_circle4.layer addAnimation:X_animation forKey:nil];
    [self.iv_circle4.layer addAnimation:Y_animation forKey:nil];
    //[self.iv_circle4.layer addAnimation:rotation forKey:nil];
    self.iv_circle4.hidden = NO;
}
- (void)showCircle5
{
    //第五个圈X轴位移动画
    CABasicAnimation *X_animation = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-60]];
    //第五个圈Y轴位移动画
    CABasicAnimation *Y_animation = [AnimationHelper moveYWithTime:ANIMATION_DURATION Y:[NSNumber numberWithFloat:0]];
    CABasicAnimation *rotation = [AnimationHelper rotateWithTime:ANIMATION_DURATION ToRotateValue:[NSNumber numberWithFloat:3.1415926]];
    [self.iv_circle5.layer addAnimation:X_animation forKey:nil];
    [self.iv_circle5.layer addAnimation:Y_animation forKey:nil];
    //[self.iv_circle5.layer addAnimation:rotation forKey:nil];
    self.iv_circle5.hidden = NO;
}

-(void)onClickImage1
{
    SpaceVC *spaceVC = [[SpaceVC alloc] init];
    [self presentModalViewController:spaceVC animated:YES];
}
-(void)onClickImage2
{
    RoomVC *roomVC = [[RoomVC alloc] init];
    [self presentModalViewController:roomVC animated:YES];
}



@end
