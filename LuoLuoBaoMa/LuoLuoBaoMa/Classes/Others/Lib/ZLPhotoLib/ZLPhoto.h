//
//  ZLPicker.h
//  ZLAssetsPickerDemo
//
//  Created by 张磊 on 14-12-17.
//  Copyright (c) 2014年 com.zixue101.www. All rights reserved.
//

#ifndef ZLAssetsPickerDemo_ZLPicker_h
#define ZLAssetsPickerDemo_ZLPicker_h

#import "ZLCameraViewController.h"
#import "ZLPhotoPickerBrowserViewController.h"
#import "ZLPhotoPickerAssetsViewController.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoPickerDatas.h"
#import "ZLPhotoPickerCommon.h"
#import "UIView+ZLExtension.h"

@interface ZLPhoto : NSObject

// 原图路径
@property (copy,nonatomic) NSString *originalImagePath;
// 缩略图
@property (strong,nonatomic) UIImage *thumbImage;
// 获取原图，通过imagePath来获取
@property (strong,nonatomic,readonly) UIImage *originalImage;

@end

#endif
