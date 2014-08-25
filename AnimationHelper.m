//
//  AnimationHelper.m
//  PM_MonitorSystem
//
//  Created by 王 李鑫 on 13-10-17.
//  Copyright (c) 2013年 PM. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

//横向移动
+ (CABasicAnimation *)moveXWithTime:(float)time X:(NSNumber *)x
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.byValue=x;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

/** 横向移动(to) */
+ (CABasicAnimation *)moveToXWithTime:(float)time X:(NSNumber *)x
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue=x;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

//纵向移动
+ (CABasicAnimation *)moveYWithTime:(float)time Y:(NSNumber *)y
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.byValue=y;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

//伸缩
+ (CABasicAnimation *)scaleWithTime:(float)time ToScaleValue:(NSNumber *)toScaleValue
{
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration = time;
    theAnimation.removedOnCompletion = NO;
    theAnimation.toValue = toScaleValue;
    return theAnimation;
}

//旋转
+ (CABasicAnimation *)rotateWithTime:(float)time ToRotateValue:(NSNumber *)toRotateValue
{
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theAnimation.duration = time;
    theAnimation.removedOnCompletion = NO;
    theAnimation.toValue = toRotateValue;
    return theAnimation;
}


@end
