//
//  NSString+Size.m
//  SuperCar
//
//  Created by JuZhenBaoiMac on 2017/5/19.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "NSString+Size.h"

#import <UIKit/UIKit.h>
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

@implementation NSString (Size)


//获取字符串size
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize{
    if (kStringIsEmpty(string)) {
        return CGSizeZero;
    }
    NSDictionary *dict = @{NSFontAttributeName : font};
    
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return size;
}


@end
