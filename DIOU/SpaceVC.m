//
//  SpaceVC.m
//  DIOU
//
//  Created by 王 李鑫 on 14-8-25.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import "SpaceVC.h"
#import "AnimationHelper.h"


#define ANIMATION_DURATION 0.8//预定义动画执行时间为0.8秒
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
    currentState = 0;
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




- (void)animation1
{
    isRunningAnimation = YES;
    self.iv_keting_small.hidden = YES;
    self.iv_keting_big.hidden = NO;
    [UIView transitionWithView:self.view duration:ANIMATION_DURATION options:UIViewAnimationOptionTransitionNone animations:^{
        self.iv_canting_small.frame = CGRectMake(self.iv_canting_small.frame.origin.x+135, 0, PAD_WIDTH/3, PAD_HEIGHT);
        self.iv_woshi_small.frame = CGRectMake(self.iv_woshi_small.frame.origin.x+135*2, 0, PAD_WIDTH/3, PAD_HEIGHT);
    } completion:^(BOOL finished) {
        isRunningAnimation = NO;
        currentState = 1;
    }];
}

- (void)animation2
{
    isRunningAnimation = YES;
    self.iv_woshi_small.hidden = YES;
    self.iv_woshi_big.hidden = NO;
    [UIView transitionWithView:self.view duration:ANIMATION_DURATION options:UIViewAnimationOptionTransitionNone animations:^{
        self.iv_keting_small.frame = CGRectMake(self.iv_keting_small.frame.origin.x-135, 0, PAD_WIDTH/3, PAD_HEIGHT);
        self.iv_canting_small.frame = CGRectMake(self.iv_canting_small.frame.origin.x+135, 0, PAD_WIDTH/3, PAD_HEIGHT);
    } completion:^(BOOL finished) {
        isRunningAnimation = NO;
        currentState = 2;
    }];
}

- (void)animation3
{
    isRunningAnimation = YES;
    self.iv_canting_small.hidden = YES;
    self.iv_canting_big.hidden = NO;
    [UIView transitionWithView:self.view duration:ANIMATION_DURATION options:UIViewAnimationOptionTransitionNone animations:^{
        self.iv_keting_small.frame = CGRectMake(self.iv_keting_small.frame.origin.x-135, 0, PAD_WIDTH/3, PAD_HEIGHT);
        self.iv_woshi_small.frame = CGRectMake(self.iv_woshi_small.frame.origin.x-135*2, 0, PAD_WIDTH/3, PAD_HEIGHT);
    } completion:^(BOOL finished) {
        isRunningAnimation = NO;
        currentState = 3;
    }];
}

/** 点击客厅小图片 */
- (void)clickKetingSmall
{
    if (isRunningAnimation) {
        return;
    }

    if (currentState == 2 || currentState ==3 ) {
        [self resetAllImage:1];
    }
    else
    {
        [self animation1];
    }
    
}


/** 点击客厅大图片 */
- (void)clickKetingBig
{
    if (isRunningAnimation) {
        return;
    }
    
    isRunningAnimation = YES;
    [self resetAllImage:0];
}



/** 点击卧室小图片 */
- (void)clickWoshiSmall
{
    if (isRunningAnimation) {
        return;
    }
    
    isRunningAnimation = YES;
    
    if (currentState == 1 || currentState ==3 ) {
        [self resetAllImage:2];
    }
    else
    {
        [self animation2];
    }
}

/** 点击卧室大图片 */
- (void)clickWoshiBig
{
    if (isRunningAnimation) {
        return;
    }
    
    
    [self resetAllImage:0];
}



/** 点击餐厅小图片 */
- (void)clickCantingSmall
{
    if (isRunningAnimation) {
        return;
    }
    
    
    
    if (currentState == 1 || currentState == 2) {
        [self resetAllImage:3];
    }
    else
    {
        [self animation3];
    }
}

/** 点击餐厅大图片 */
- (void)clickCantingBig
{
    if (isRunningAnimation) {
        return;
    }

    isRunningAnimation = YES;
    [self resetAllImage:0];
}



/** 恢复所有图片位置 */
- (void)resetAllImage:(int)type
{
    isRunningAnimation = YES;
    [UIView transitionWithView:self.view duration:ANIMATION_DURATION options:UIViewAnimationOptionTransitionNone animations:^{
        self.iv_keting_small.frame = CGRectMake(0, 0, PAD_WIDTH/3, PAD_HEIGHT);
        self.iv_canting_small.frame = CGRectMake(PAD_WIDTH/3*2, 0, PAD_WIDTH/3, PAD_HEIGHT);
        self.iv_woshi_small.frame = CGRectMake(PAD_WIDTH/3, 0, PAD_WIDTH/3, PAD_HEIGHT);
    } completion:^(BOOL finished) {
        self.iv_keting_small.hidden = NO;
        self.iv_woshi_small.hidden = NO;
        self.iv_canting_small.hidden = NO;
        self.iv_keting_big.hidden = YES;
        self.iv_woshi_big.hidden = YES;
        self.iv_canting_big.hidden = YES;
        isRunningAnimation = NO;
        
        switch (type) {
            case 1:
                [self animation1];
                break;
            case 2:
                [self animation2];
                break;
            case 3:
                [self animation3];
                break;
            default:
                break;
        }
        
    }];
}



/** 关闭此模态视图 */
- (IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
