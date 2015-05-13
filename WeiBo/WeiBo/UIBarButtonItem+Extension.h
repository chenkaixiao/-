//
//  UIBarButtonItem+Extension.h
//  WeiBo
//
//  Created by zero on 15/3/31.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithImageName:(NSString *)ImageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
@end
