//
//  CVWrapper.mm
//  OpenCVPractice
//
//  Created by Tim on 2021/12/22.
//

#import "CVWrapper.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace std;
using namespace cv;

@implementation CVWrapper

+ (NSString *)openCVVersion {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}

//+ (UIImage *)detectParagraphArea:(UIImage *)image {
//
//  cv::Mat imageMat;
//
//  UIImageToMat(image, imageMat);
//
//  if (imageMat.channels() == 1)
//    return image;
//
//  cv::Mat grayMat;
//  cv::cvtColor(imageMat, grayMat, COLOR_BGR2GRAY);
//
//  return MatToUIImage(grayMat);
//
//}
+ (UIImage *)detectParagraphArea:(UIImage *)image {

  cv::Mat imageMat;
  UIImageToMat(image, imageMat);
  if (imageMat.channels() == 1)
    return image;

  // Load image, grayscale, Gaussian blur, Otsu's threshold

  cv::Mat grayMat;
  cv::cvtColor(imageMat, grayMat, COLOR_BGR2GRAY);

  cv::Mat blurMat;
  cv::GaussianBlur(grayMat, blurMat, cv::Size(7,7), 0);

  cv::Mat threshMat;
  cv::threshold(blurMat, threshMat, 127, 255, cv::THRESH_BINARY_INV);

  // Create Rectangular structuring element and dilate

  cv::Mat kernelMat = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(44,44));

  cv::Mat dilateMat;

  cv::dilate(threshMat, dilateMat, kernelMat);

  // Fing contours and draw rectangle
//  cv::Mat cntsMat;
//  cv::findContours(dilateMat, cntsMat, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

  std::vector<std::vector<cv::Point> > contours;
  findContours(dilateMat, contours, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);

//  for(size_t i = 0; i < contours.size(); i++) {
//    print(contours[i]);
  //  }

//  Mat drawing = Mat::zeros(imageMat.size(), CV_8UC3 );
  for( size_t i = 0; i< contours.size(); i++ )
  {
    cv::Scalar colorScalar = cv::Scalar( 94, 206, 165 );
//    drawContours(drawing, contours, i, colorScalar);
//    cv::Scalar colorScalar = cv::scala

    cv::Rect rect = boundingRect(contours[i]);
//    cv::rectangle(imageMat, rect, colorScalar);
    cv::rectangle(imageMat, rect, colorScalar, 3);
  }

  return MatToUIImage(imageMat);
}


@end
