//
//  ZFMediaAuthorityManager.h
//  CustomTabApp
//
//  Created by fzzhao on 2019/7/30.
//  Copyright © 2019 fzzhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMediaAuthorityManager : NSObject

/**
 *  判断相机权限
 */
- (void)getVideoAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion;

/**
 *  判断麦克风权限
 */
- (void)getAudioAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion;

/**
 *  判断是否有相册权限
 */
- (void)getPhotoAuthorizationStatus:(void(^)(BOOL isPermitted, UIAlertController *alertController))completion;

@end

NS_ASSUME_NONNULL_END
