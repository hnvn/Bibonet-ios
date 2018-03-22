//
//  TGPresentationAssets+Bibo.m
//  Bibonet
//
//  Created by Ha Duy Hung on 3/21/18.
//

#import "TGPresentationAssets+Bibo.h"
#import <LegacyComponents/LegacyComponents.h>

@implementation TGPresentationAssets (Bibo)

+ (UIImage *)tabBarCartIcon:(UIColor *)color
{
    NSString *code = @"M9.3,24.8 C7.595,24.8 6.2,26.195 6.2,27.9 C6.2,29.605 7.595,31 9.3,31 C11.005,31 12.4,29.605 12.4,27.9 C12.4,26.195 11.005,24.8 9.3,24.8 Z M0,0 L0,3.1 L3.1,3.1 L8.68,14.88 L6.51,18.6 C6.355,19.065 6.2,19.685 6.2,20.15 C6.2,21.855 7.595,23.25 9.3,23.25 L27.9,23.25 L27.9,20.15 L9.92,20.15 C9.765,20.15 9.61,19.995 9.61,19.84 L9.61,19.6849392 L11.005,17.0499392 L22.475,17.0499392 C23.715,17.0499392 24.645,16.4299392 25.11,15.4999392 L30.69,5.425 C31,5.115 31,4.96 31,4.65 C31,3.72 30.38,3.1 29.45,3.1 L6.51,3.1 L5.115,0 L0,0 Z M24.8,24.8 C23.095,24.8 21.7,26.195 21.7,27.9 C21.7,29.605 23.095,31 24.8,31 C26.505,31 27.9,29.605 27.9,27.9 C27.9,26.195 26.505,24.8 24.8,24.8 Z";
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(31, 31), false, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 0.8f, 0.8f);
    CGContextTranslateCTM(context, 3.0f, 4.0f);
    CGContextSetFillColorWithColor(context, color.CGColor);
    TGDrawSvgPath(context, code);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
