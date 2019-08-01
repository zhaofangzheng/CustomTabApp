//
//  ZFTabBarController.m
//  CustomTabApp
//
//  Created by fzzhao on 2018/11/1.
//  Copyright © 2018年 fzzhao. All rights reserved.
//

#import "ZFTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ZFNavigationController.h"
#import "ZFTabBar.h"

@implementation ZFTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setValue:[[ZFTabBar alloc] init] forKey:@"tabBar"];
    [self creatViewControllers];
}

- (void)creatViewControllers
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    
    ZFNavigationController *firstNav = [[ZFNavigationController alloc] initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"首页";
    
    ZFNavigationController *secondNav = [[ZFNavigationController alloc] initWithRootViewController:[[SecondViewController alloc] init]];
    secondNav.tabBarItem.title = @"活动";
//    secondNav.tabBarItem.image = [UIImage imageNamed:@"elevation_weakspots_instantiate_levelOne"];
    secondNav.tabBarItem.image = [UIImage imageNamed:@"elevation_weakspots_instantiate_levelOne" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    
    ZFNavigationController *thirdNav = [[ZFNavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    thirdNav.tabBarItem.title = @"设置";
    
    self.viewControllers = @[firstNav,secondNav,thirdNav];
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController
{
    [super setSelectedViewController:selectedViewController];
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
