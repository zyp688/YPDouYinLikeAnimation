//
//  YPDouYinDianZanAnimationTool.h
//  TestDemo
//
//  Created by Work_Zyp on 2018/1/24.
//  Copyright © 2018年 Work_Zyp. All rights reserved.
//           ______      ____           _          _
//   /\_/\  | _____ \   /___ \  _   _  (_)   ___  | | __
//   \_ _/  | |___/ /  //  / / | | | | | |  / __| | |/ /
//    / \   | |____/  / \_/ /  | |_| | | | | (__  |   <
//    \_/   |_|       \___,_\   \__,_| |_|  \___| |_|\_\
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YPDouYinLikeAnimation : NSObject

/**  获取单例对象*/
+ (instancetype)shareInstance;

/**  系统touch来触发的动画*/
- (void)createAnimationWithTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

/**  点击来触发的动画*/
- (void)createAnimationWithTap:(UITapGestureRecognizer *)tap;



@end
