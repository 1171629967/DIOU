//
//  SpaceVC.m
//  DIOU
//
//  Created by 王 李鑫 on 14-8-25.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import "SpaceVC.h"
#import "AnimationHelper.h"


#define ANIMATION_DURATION 1.5//预定义动画执行时间为1.5秒
@interface SpaceVC ()

@end

@implementation SpaceVC

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
    isRunningAnimation = NO;
    
    //依次给图片添加点击监听
    self.iv_keting_small.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickKetingSmall)];
    [self.iv_keting_small addGestureRecognizer:singleTap1];
    
    self.iv_woshi_small.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickWoshiSmall)];
    [self.iv_woshi_small addGestureRecognizer:singleTap2];
    
    self.iv_canting_small.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap3 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCantingSmall)];
    [self.iv_canting_small addGestureRecognizer:singleTap3];
    
    self.iv_keting_big.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap4 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickKetingBig)];
    [self.iv_keting_big addGestureRecognizer:singleTap4];
    
    self.iv_woshi_big.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap5 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickWoshiBig)];
    [self.iv_woshi_big addGestureRecognizer:singleTap5];
    
    self.iv_canting_big.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap6 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCantingBig)];
    [self.iv_canting_big addGestureRecognizer:singleTap6];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/** 点击客厅小图片 */
- (void)clickKetingSmall
{
    if (isRunningAnimation) {
        return;
    }
    
    if (self.iv_keting_big.hidden == NO || self.iv_woshi_big.hidden == NO || self.iv_canting_big.hidden == NO) {
        return;
    }
    
    self.iv_keting_small.hidden = YES;
    self.iv_woshi_small.hidden = NO;
    self.iv_canting_small.hidden = NO;
    self.iv_keting_big.hidden = NO;
    self.iv_woshi_big.hidden = YES;
    self.iv_canting_big.hidden = YES;
    
    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135]];
    [self.iv_canting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135*2]];
    [self.iv_woshi_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
    
    
}



/** 点击客厅大图片 */
- (void)clickKetingBig
{
    if (isRunningAnimation) {
        return;
    }
    
    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135]];
    [self.iv_canting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135*2]];
    [self.iv_woshi_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(stopAnimation2) withObject:nil afterDelay:ANIMATION_DURATION];
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
}

-(void)stopAnimation2
{
    self.iv_keting_big.hidden = YES;
    self.iv_keting_small.hidden = NO;
}

/** 点击卧室小图片 */
- (void)clickWoshiSmall
{
    if (isRunningAnimation) {
        return;
    }
    
    if (self.iv_keting_big.hidden == NO || self.iv_woshi_big.hidden == NO || self.iv_canting_big.hidden == NO) {
        return;
    }
    
    self.iv_keting_small.hidden = NO;
    self.iv_woshi_small.hidden = YES;
    self.iv_canting_small.hidden = NO;
    self.iv_keting_big.hidden = YES;
    self.iv_woshi_big.hidden = NO;
    self.iv_canting_big.hidden = YES;
    
    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135]];
    [self.iv_keting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135]];
    [self.iv_canting_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
}

/** 点击卧室大图片 */
- (void)clickWoshiBig
{
    if (isRunningAnimation) {
        return;
    }
    
    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135]];
    [self.iv_keting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135]];
    [self.iv_canting_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(stopAnimation4) withObject:nil afterDelay:ANIMATION_DURATION];
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
}

-(void)stopAnimation4
{
    self.iv_woshi_big.hidden = YES;
    self.iv_woshi_small.hidden = NO;
}

/** 点击餐厅小图片 */
- (void)clickCantingSmall
{
    if (isRunningAnimation) {
        return;
    }
    
    if (self.iv_keting_big.hidden == NO || self.iv_woshi_big.hidden == NO || self.iv_canting_big.hidden == NO) {
        return;
    }
    
    self.iv_keting_small.hidden = NO;
    self.iv_woshi_small.hidden = NO;
    self.iv_canting_small.hidden = YES;
    self.iv_keting_big.hidden = YES;
    self.iv_woshi_big.hidden = YES;
    self.iv_canting_big.hidden = NO;
    
    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135]];
    [self.iv_keting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:-135*2]];
    [self.iv_woshi_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
}

/** 点击餐厅大图片 */
- (void)clickCantingBig
{
    if (isRunningAnimation) {
        return;
    }

    isRunningAnimation = YES;
    
    CABasicAnimation *animation1 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135]];
    [self.iv_keting_small.layer addAnimation:animation1 forKey:nil];
    CABasicAnimation *animation2 = [AnimationHelper moveXWithTime:ANIMATION_DURATION X:[NSNumber numberWithFloat:135*2]];
    [self.iv_woshi_small.layer addAnimation:animation2 forKey:nil];
    
    [self performSelector:@selector(stopAnimation6) withObject:nil afterDelay:ANIMATION_DURATION];
    [self performSelector:@selector(resetRunningAnimationState) withObject:nil afterDelay:ANIMATION_DURATION];
}

-(void)stopAnimation6
{
    self.iv_canting_big.hidden = YES;
    self.iv_canting_small.hidden = NO;
}

/** 恢复运行动画状态标识 */
-(void)resetRunningAnimationState
{
    isRunningAnimation = NO;
}

/** 关闭此模态视图 */
- (IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
