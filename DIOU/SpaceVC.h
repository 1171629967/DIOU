//
//  SpaceVC.h
//  DIOU
//
//  Created by 王 李鑫 on 14-8-25.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceVC : UIViewController
{
    BOOL isRunningAnimation;
    /** 没展开0  客厅展开1  卧室展开2  餐厅展开3*/
    int currentState;
}


@property (strong, nonatomic) IBOutlet UIImageView *iv_keting_big;

@property (strong, nonatomic) IBOutlet UIImageView *iv_woshi_big;

@property (strong, nonatomic) IBOutlet UIImageView *iv_canting_big;


@property (strong, nonatomic) IBOutlet UIImageView *iv_woshi_small;
@property (strong, nonatomic) IBOutlet UIImageView *iv_keting_small;
@property (strong, nonatomic) IBOutlet UIImageView *iv_canting_small;

@property (strong, nonatomic) IBOutlet UIButton *bt_back;
- (IBAction)back:(id)sender;

@end
