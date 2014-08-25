//
//  HomeVC.m
//  DIOU
//
//  Created by 王 李鑫 on 14-8-25.
//  Copyright (c) 2014年 DO. All rights reserved.
//

#import "HomeVC.h"
#import "ChooseVC.h"
#import "WLXAppDelegate.h"

@interface HomeVC ()

@end

@implementation HomeVC

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
    [self performSelector:@selector(replaceVC) withObject:nil afterDelay:0.8];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)replaceVC{
        ChooseVC *chooseVC = [[ChooseVC alloc] init];
        WLXAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.window.rootViewController = chooseVC;
    
        CATransition *animation = [CATransition animation];
        [animation setDuration:2];
        animation.type = @"rippleEffect"; //波浪
        [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
}

@end
