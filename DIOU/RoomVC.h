//
//  RoomVC.h
//  DIOU
//
//  Created by 王 李鑫 on 14-8-26.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCircleImageView.h"

@interface RoomVC : UIViewController
{
   int startX;
   int endX;
    NSMutableArray *array;
    int currentImageNo;
    FTCircleImageView *circleView;
}

@property (strong, nonatomic) IBOutlet UIButton *iv_back;
- (IBAction)dismissVC:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *iv_shafa;

@end
