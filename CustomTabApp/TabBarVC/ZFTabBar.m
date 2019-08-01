//
//  ZFTabBar.m
//  CustomTabApp
//
//  Created by fzzhao on 2018/11/1.
//  Copyright © 2018年 fzzhao. All rights reserved.
//

#import "ZFTabBar.h"

@implementation ZFTabBar

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"1");
    if (view == nil && !self.hidden) {
        NSLog(@"2");
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                for (UIView *lastSubView in subView.subviews) {
                    CGPoint subPoint = [lastSubView convertPoint:point fromView:self];
                    if (CGRectContainsPoint(lastSubView.bounds, subPoint)) {
                        NSLog(@"3");
                        //有个问题就是bounds是方形的，而图片可能显示出来的是圆形的，这就导致点击图片外的区域也可能是在方形的范围内，看起来效果会奇怪
                        return subView;
                    }
                }
            }
            
        }
    }
    return view;
}

@end
