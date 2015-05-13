//
//  KXSearchBar.m
//  WeiBo
//
//  Created by zero on 15/3/31.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXSearchBar.h"

@implementation KXSearchBar

//说明：init方法内部会调用initWithFrame：方法
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //实现初始化控件的代码
        //垂直居中
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        //设置搜索框的背景颜色为提供的图片
        self.background=[UIImage resizedImage:@"searchbar_textfield_background"];
       
        
        //添加放大镜
        UIImageView *leftView=[[UIImageView alloc]init];
        leftView.image=[UIImage imageWithName:@"searchbar_textfield_search_icon"];
//        leftView.backgroundColor=[UIColor redColor];
        //设置放大镜距离两边的间隔
        leftView.width=leftView.image.size.width+10;
        leftView.height=leftView.width;
        
        //设置放大镜居中
        leftView.contentMode=UIViewContentModeCenter;
        self.leftView=leftView;
        //设置左边永远显示
        self.leftViewMode=UITextFieldViewModeAlways;
        
        //设置全部清除按钮，永远显示
        self.clearButtonMode=UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)SearchBar
{
    return [[self alloc]init];
}

@end
