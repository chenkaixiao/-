//
//  KXNavigationController.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXNavigationController.h"



@interface KXNavigationController ()

@end

@implementation KXNavigationController


#pragma mark - 第一次调用该类的时候会调用一次该方法
+(void)initialize
{
    
    //设置UIBarButtonItem的主题
    [self setUpBarButtonItemTheme];
    
    //设置UINavigationBar的主题
    [self setNavigationBarTheme];
}

#pragma mark - 设置UINavigationBar的主题

+(void)setNavigationBarTheme
{
    // 通过设置apperance 对象能够膝盖整个项目所有navigationBar样式
    UINavigationBar *apperance = [UINavigationBar appearance];
    
    // 设置导航栏的背景
    /*
     * 模拟器在切换到ios7之后，导航栏下角有一条阴影线。
     * 是因为ios中，66-64多出了2个像素点。把导航栏的背景去掉后
     */
    if(!iOS7)
    {
        [apperance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    
    // 设置文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    // 设置文字颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    // 设置偏移量 0
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];???
    [apperance setTitleTextAttributes:textAttrs];
    
    
}
#pragma mark - 设置UIBarButtonItem 的主题
+(void)setUpBarButtonItemTheme
{
    // 通过设置appearance对象，能够修改整个项目的UIBarButtonItem的样式
    UIBarButtonItem *apperance = [UIBarButtonItem appearance];
    
    
    // 设置文字的属性
    // 1 设置普通状态下的文字的属性
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // 设置字体
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    // 这是偏移量为 0
    textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    // 设置颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [apperance setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    
    // 3 设置不可用转台下文字的属性
    // 使用1 的textAttrs进行通用设置
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [apperance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    
    // 设置背景
    // 技巧提示： 为乐让某个按钮的背景消失 可以设置一张完全透明的背景图片
    [apperance setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - 拦截push方法 隐藏tabBar 工具条 设置导航条的左右上角的按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1 如果push的不是站定控制器，那么就隐藏tabBar工具条
    if(self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 在这里设置左右上角的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem= [UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    // 2 实现父类的方法
    [super pushViewController:viewController animated:YES];
}
#pragma mark -  返回
-(void)back
{
    [self popViewControllerAnimated:YES];
    
}
#pragma mark -
-(void)more
{
    [self popToRootViewControllerAnimated:YES];
}
@end
