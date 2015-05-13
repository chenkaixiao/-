//
//  UIImage+Extension.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)



+(UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if(iOS7)// 处理iOS 7的情况
    {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    if(image == nil)
        image = [UIImage imageNamed:name];
    
    return image;
}

+(UIImage *)resizedImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
