//
//  ViewController.m
//  YPDouYinLikeAnimationDemo
//
//  Created by Work_Zyp on 2018/1/29.
//  Copyright © 2018年 Work_Zyp. All rights reserved.
//
//           ______      ____           _          _
//   /\_/\  | _____ \   /___ \  _   _  (_)   ___  | | __
//   \_ _/  | |___/ /  //  / / | | | | | |  / __| | |/ /
//    / \   | |____/  / \_/ /  | |_| | | | | (__  |   <
//    \_/   |_|       \___,_\   \__,_| |_|  \___| |_|\_\
//

#import "ViewController.h"
#import "YPDouYinLikeAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[YPDouYinLikeAnimation shareInstance] createAnimationWithTouch:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
