//
//  CVWrapper.h
//  OpenCVPractice
//
//  Created by Tim on 2021/12/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CVWrapper : NSObject

+ (NSString *)openCVVersion;

+ (UIImage *)detectParagraphArea:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
