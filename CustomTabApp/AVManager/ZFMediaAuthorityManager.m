//
//  ZFMediaAuthorityManager.m
//  CustomTabApp
//
//  Created by fzzhao on 2019/7/30.
//  Copyright © 2019 fzzhao. All rights reserved.
//

#import "ZFMediaAuthorityManager.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation ZFMediaAuthorityManager

/**
 *  判断相机权限
 */
- (void)getVideoAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion {
    NSLog(@"开始调用相机权限");
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    NSLog(@"获取了相机权限状态");
    if (authStatus == AVAuthorizationStatusRestricted ||
        authStatus == AVAuthorizationStatusDenied) {
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        UIAlertController *alertVC = [self showAlertViewWithMessage:errorStr];
        completion(NO,alertVC);
    } else {
        completion(YES,nil);
    }
}

/**
 *  判断麦克风权限
 */
- (void)getAudioAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion {
    NSLog(@"开始调用麦克风权限");
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    NSLog(@"获取了麦克风权限状态");
    if (authStatus == AVAuthorizationStatusRestricted ||
        authStatus == AVAuthorizationStatusDenied) {
        NSString *errorStr = @"麦克风权限受限,请在设置中启用";
        UIAlertController *alertVC = [self showAlertViewWithMessage:errorStr];
        completion(NO,alertVC);
    } else {
        completion(YES,nil);
    }
}

/**
 *  判断是否有相册权限
 */
- (void)getPhotoAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion {
    NSLog(@"开始调用相册权限");
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    NSLog(@"获取了相册权限状态");
    if (authStatus == PHAuthorizationStatusRestricted ||
        authStatus == PHAuthorizationStatusDenied) {
        NSString *errorStr = @"应用相册权限受限,请在设置中启用";
        UIAlertController *alertVC = [self showAlertViewWithMessage:errorStr];
        completion(NO,alertVC);
    } else {
        completion(YES,nil);
    }
}

/**
 *  弹框
 */
- (UIAlertController *)showAlertViewWithMessage:(NSString *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ensureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:ensureAction];
    [alertVC addAction:cancelAction];
    return alertVC;
}

@end
