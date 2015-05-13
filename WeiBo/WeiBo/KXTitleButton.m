//
//  KXTitleButton.m
//  WeiBo
//
//  Created by zero on 15/4/1.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXTitleButton.h"

@implementation KXTitleButton


-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        // 设置图片居中
        self.imageView.contentMode =UIViewContentModeCenter;
        // 当高亮时，不调整图片
        [self setAdjustsImageWhenHighlighted:NO];
        // 设置文字对齐方式为右对齐
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        // 设置文字颜色为黑色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置文字的字体统一为 20
        self.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}

// 设置内部图标的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH =imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 设置内容文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
   
    CGFloat titleH =self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
