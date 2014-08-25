//
//  AnimationHelper.h
//  PM_MonitorSystem
//
//  Created by 王 李鑫 on 13-10-17.
//  Copyright (c) 2013年 PM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationHelper : NSObject

//横向移动
+ (CABasicAnimation *)moveXWithTime:(float)time X:(NSNumber *)x;

//纵向移动
+ (CABasicAnimation *)moveYWithTime:(float)time Y:(NSNumber *)Y;

//伸缩
+ (CABasicAnimation *)scaleWithTime:(float)time ToScaleValue:(NSNumber *)toScaleValue;

//旋转
+ (CABasicAnimation *)rotateWithTime:(float)time ToRotateValue:(NSNumber *)toRotateValue;

@end
