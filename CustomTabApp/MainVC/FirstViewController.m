//
//  FirstViewController.m
//  CustomTabApp
//
//  Created by fzzhao on 2018/11/1.
//  Copyright © 2018年 fzzhao. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import <QuickLook/QuickLook.h>

@interface FirstViewController ()<QLPreviewControllerDelegate,QLPreviewControllerDataSource>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 150, 50, 50);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick
{
//    QLPreviewController *qlvc = [[QLPreviewController alloc] init];
//    qlvc.delegate = self;
//    qlvc.dataSource = self;
////    [self presentViewController:qlvc animated:YES completion:nil];
//    [self.navigationController pushViewController:qlvc animated:YES];
    
    FirstViewController *svc = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 2;
//    return 1;
}
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ql_pc" ofType:@"ppt"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"ql_word" ofType:@"docx"];
    path = index == 0?path:path2;
    return [NSURL fileURLWithPath:path];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

@end
