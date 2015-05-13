//
//  KXTabBarViewController.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXTabBarViewController.h"
#import "KXNavigationController.h"

#import "KXHomeTableViewController.h"
#import "KXDiscoverViewController.h"
#import "KXMessageViewController.h"
#import "KXProfileViewController.h"

#import "UIImage+Extension.h"

@interface KXTabBarViewController ()

@end

@implementation KXTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 添加四个子控制器
    KXHomeTableViewController *home = [[KXHomeTableViewController alloc]init];
    [self addOneChildVc:home title:@"主页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    KXMessageViewController *message=[[KXMessageViewController alloc]init];
          [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    KXDiscoverViewController *discover=[[KXDiscoverViewController alloc]init];
          [self addOneChildVc:discover title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    KXProfileViewController *profile=[[KXProfileViewController alloc]init];
          [self addOneChildVc:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
}

#pragma mark - 封装添加子控制器的方法
-(void)addOneChildVc:(UIViewController*)childVc title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName
{
    
    // 1 随机设置子控制器的背景颜色
    childVc.view.backgroundColor = KXRandomColor;
    // 2 设置标题
    childVc.tabBarItem.title = title;       // tabBar标题
      childVc.navigationItem.title = title; //设置导航条的标题
//    childVc.title = title; // 可设置两者
    // 3 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 4 选中的图标
    UIImage *selImage = [UIImage imageWithName:imageName];
    
    if(iOS7)
    {
        // 不用渲染
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    childVc.tabBarItem.selectedImage = selImage;
  
    // 5 添加子控件在导航器中
    KXNavigationController *navVC = [[KXNavigationController alloc]initWithRootViewController:childVc];
    
    
    // 6 导航器放入UITabBarViewController中
    [self addChildViewController:navVC];
}




@end
