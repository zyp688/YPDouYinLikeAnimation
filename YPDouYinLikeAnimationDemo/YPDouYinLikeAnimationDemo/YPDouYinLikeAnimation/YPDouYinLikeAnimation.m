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
NSString *const yp_heartImgName = @"video_icon_like";
/** ❤️形图片的宽度*/
const CGFloat yp_heartImgWidth = 80;
/** ❤️形图片的高度*/
const CGFloat yp_heartImgHeght = 80;
//---------------------------------------------私有定制·配置区


@interface YPDouYinLikeAnimation ()

/**  图片队列*/
@property (nonatomic, strong)NSMutableArray *imgsArr;
/**  记录上一个响应点*/
@property (nonatomic, assign)CGPoint lastPoint;
/**  当前有正在执行中的动画标志，控制队列*/
@property (nonatomic, assign)BOOL isAnimationING;

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
    UIImage *img = [UIImage imageNamed:@"video_icon_like"];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, yp_heartImgWidth, yp_heartImgHeght)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    [[touch view] addSubview:imgV];
    
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformMakeRotation(M_PI / 10.0 * leftOrRight);
    [self.imgsArr addObject:imgV];
    [self performSelector:@selector(startAnimations) withObject:nil afterDelay:0.15];
}

/**  点击来触发的动画*/
#pragma mark -
#pragma mark - 🎱 createAnimationWithTap:
- (void)createAnimationWithTap:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:[tap view]];
    UIImage *img = [UIImage imageNamed:yp_heartImgName];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, yp_heartImgWidth, yp_heartImgHeght)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    [[tap view] addSubview:imgV];
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformMakeRotation(M_PI / 10.0 * leftOrRight);
    [self.imgsArr addObject:imgV];
    [self performSelector:@selector(startAnimations) withObject:nil afterDelay:0.15];
}

#pragma mark -
#pragma mark - 🎱 startAnimations 开始触发动画
- (void)startAnimations {
    if (self.isAnimationING) {
        return;
    }
    if (self.imgsArr.count) {
        __block UIImageView *firstImgV = [self.imgsArr firstObject];
        self.isAnimationING = YES;
        [UIView animateWithDuration:0.25 animations:^{
            firstImgV.transform = CGAffineTransformMakeScale(3.0, 3.0);
            firstImgV.alpha = 0.1;
        } completion:^(BOOL finished) {
            self.isAnimationING = NO;
            firstImgV.hidden = YES;
            [self.imgsArr removeObject:firstImgV];
            firstImgV = nil;
            if (self.imgsArr.count) {
                [self performSelector:@selector(startAnimations) withObject:nil afterDelay:0.35];
            }
        }];
    }
}

#pragma mark -
#pragma mark - 🎱 减方法
- (NSMutableArray *)imgsArr {
    if (!_imgsArr) {
        _imgsArr = [NSMutableArray array];
    }
    
    return _imgsArr;
}

@end
