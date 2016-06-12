//
//  ImageHelper.h
//  QSHealthCare
//
//  Created by 张金龙 on 15/11/6.
//  Copyright © 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface ImageHelper : NSObject

+ (void)SaveImageToFile:(UIImage *)image fileName:(NSString *)fileName;

+ (UIImage *)GetImageByFileName:(NSString *)fileName;

+ (void)DeleteFileByFileName:(NSString *)fileName;

+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

+ (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

+ (UIImage *)thumbnailForAsset:(ALAsset *)asset maxPixelSize:(NSUInteger)size;
// 获取图片  根据ALAsset
+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;

// 压缩 指定大小的kb 图片
+ (UIImage *)compressImage:(UIImage *)image toMaxFileSizeKb:(NSInteger)maxKb;

@end
