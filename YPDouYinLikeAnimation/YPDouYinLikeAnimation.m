 //
//  YPDouYinDianZanAnimationTool.m
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

#import "YPDouYinLikeAnimation.h"

//---------------------------------------------私有定制·配置区
/** ❤️形图片的名字*/
NSString *const yp_heartImgName = @"yp_video_like";
/** ❤️形图片的宽度*/
const CGFloat yp_heartImgWidth = 80;
/** ❤️形图片的高度*/
const CGFloat yp_heartImgHeight = 80;
//---------------------------------------------私有定制·配置区


@interface YPDouYinLikeAnimation ()


@end

@implementation YPDouYinLikeAnimation

#pragma mark -
#pragma mark - 🎱 shareInstance 多线程单例
+ (instancetype)shareInstance {
    static YPDouYinLikeAnimation *selfInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        selfInstance = [[self alloc] init];
    });
    
    return selfInstance;
}

/**  系统touch来触发的动画*/
#pragma mark -
#pragma mark - 🎱 createAnimationWithTounch: withEvent:
- (void)createAnimationWithTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    UIImage *img = [UIImage imageNamed:yp_heartImgName];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, yp_heartImgWidth, yp_heartImgHeight)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    
    /**  左右随机显示*/
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformRotate(imgV.transform,M_PI / 9 * leftOrRight);
    [[touch view] addSubview:imgV];
    
    /** 出现的时候回弹一下*/
    __block UIImageView *blockImgV = imgV;
    [UIView animateWithDuration:0.1 animations:^{
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 1.2, 1.2);
    } completion:^(BOOL finished) {
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 0.8, 0.8);
        /** 向上飘，放大，透明*/
        [self performSelector:@selector(animationToTop:) withObject:blockImgV afterDelay:0.3];
    }];
}


/**  点击来触发的动画*/
#pragma mark -
#pragma mark - 🎱 createAnimationWithTap:
- (void)createAnimationWithTap:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:[tap view]];
    UIImage *img = [UIImage imageNamed:yp_heartImgName];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, yp_heartImgWidth, yp_heartImgHeight)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    [[tap view] addSubview:imgV];
    
    /**  左右随机显示*/
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformRotate(imgV.transform,M_PI / 9 * leftOrRight);
    
    /** 出现的时候回弹一下*/
    __block UIImageView *blockImgV = imgV;
    [UIView animateWithDuration:0.1 animations:^{
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 1.2, 1.2);
    } completion:^(BOOL finished) {
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 0.8, 0.8);
        /** 向上飘，放大，透明*/
        [self performSelector:@selector(animationToTop:) withObject:blockImgV afterDelay:0.3];
    }];
    
}

#pragma mark -
#pragma mark - 🎱 animationToTop
- (void)animationToTop:(UIImageView *)blockImgV {
    [UIView animateWithDuration:1.0 animations:^{
        blockImgV.frame = CGRectMake(blockImgV.frame.origin.x, blockImgV.frame.origin.y - 100, blockImgV.frame.size.width, blockImgV.frame.size.height);
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 1.8, 1.8);
        blockImgV.alpha = 0.0;
    } completion:^(BOOL finished) {
        
    }];
}

@end
