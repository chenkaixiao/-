//
//  KXPopMenu.h
//  WeiBo
//
//  Created by zero on 15/4/1.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KXPopMenu;

@protocol KXPopMenuDelegate <NSObject>

@optional
-(void)popMenuDidDismissed:(KXPopMenu*)popMenu;

@end

@interface KXPopMenu : UIView

//初始化方法
-(instancetype)initWithContentView:(UIView*)contentView;
+(instancetype)popMenuWithContentView:(UIView*)contentView;


// 设置菜单的背景图片
-(void)setBackground:(UIImage*)backgroundImage;

// 显示菜单
-(void)showInRect:(CGRect)rect;

// 关闭菜单
-(void)dismiss;
@property(nonatomic,weak)id<KXPopMenuDelegate> delegate;
@end
