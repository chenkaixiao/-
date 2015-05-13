//
//  KXDiscoverViewController.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXDiscoverViewController.h"
#import "KXSearchBar.h"
@interface KXDiscoverViewController ()

@end

@implementation KXDiscoverViewController

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
    
    // 设置BarButtonItem
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"系统设置" style:UIBarButtonItemStyleDone target:self action:nil];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"系统设置" style:UIBarButtonItemStyleDone target:self action:nil];
//    
//    // 左边不可以点击
//    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    
    // --- 搜搜栏
    // 第一种方法
//    UISearchBar *seachBar = [[UISearchBar alloc]init];
//    // 设置bar的frame
//    seachBar.frame = CGRectMake(0, 0, 320, 35);
//    self.navigationItem.titleView = seachBar;
//    
    // 第二种方法 （为了iOS 6）
//    UISearchBar *seachBar = [[UISearchBar alloc]init];
//    // 设置bar的frame
//    seachBar.frame = CGRectMake(0, 0, 320, 35);
//    seachBar.backgroundImage = [UIImage resizedImage:@"searchbar_textfield_background"];
//    self.navigationItem.titleView = seachBar;
    
    //添加一个搜索框(封装) 自定义控件一般是继承封装
    KXSearchBar *searchBar=[KXSearchBar SearchBar];
    searchBar.frame=CGRectMake(0, 100, 300, 35);
    self.navigationItem.titleView=searchBar;
    self.navigationItem.titleView = searchBar;
    

}

@end
