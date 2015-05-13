//
//  KXPopMenu.m
//  WeiBo
//
//  Created by zero on 15/4/1.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXPopMenu.h"


@interface KXPopMenu ()
//
@property(nonatomic,strong)UIView *contentView;
//
@property(nonatomic,strong)UIImageView *container;

// 最底层的
@property(nonatomic,strong)UIButton *cover;
@end

@implementation KXPopMenu

-(void)dealloc
{
    self.contentView = nil;
    self.container =nil;
    self.cover = nil;
 
}
#pragma mark - init方法回调用该方法
-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        // 添加内部两个子空间
        // 1 添加一个遮盖按钮
        UIButton *cover= [[UIButton alloc]init];
        
        // 清除颜色
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        //  2 添加当家头的菜单图片
        UIImageView *container  =[[UIImageView alloc]init];
        container.userInteractionEnabled = YES;
        container.size = CGSizeMake(200, 100);
        
    }
    return self;
}

-(instancetype)initWithContentView:(UIView *)contentView
{
    if(self = [super init])
    {
       
        NSLog(@"test 测试！");
    }
    return self;
}



+(instancetype)popMenuWithContentView:(UIView *)contentView
{
    return [[self alloc]initWithContentView:contentView];
}
@end
