//
//  RoomVC.m
//  DIOU
//
//  Created by 王 李鑫 on 14-8-26.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import "RoomVC.h"

@interface RoomVC ()

@end

@implementation RoomVC

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
    
    //初始化一个底部的scrollview加入视图
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 648, 1024, 120)];
    [sv setTag:100];
    sv.scrollEnabled = YES;
    sv.backgroundColor = [UIColor grayColor];
    [self.view addSubview:sv];
    
    for (int i = 0; i < 8; i++) {
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(i*200+10*(i+1), 10, 200, 100)];
        [iv setTag:200+i];
        UIImage *image = [UIImage imageNamed:@"aa"];
        [iv setImage:image];
        [sv addSubview:iv];
    }
    
    //设置scrollview可滚动范围
    [sv setContentSize:CGSizeMake(200*8+10*(8+1), 120)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissVC:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
@end