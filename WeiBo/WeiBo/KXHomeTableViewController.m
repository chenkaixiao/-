//
//  KXHomeTableViewController.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXHomeTableViewController.h"
#import  "KXOneViewController.h"
#import "KXTitleButton.h"

@interface KXHomeTableViewController ()
@property(nonatomic,assign)BOOL isDown;

@end

@implementation KXHomeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - viewLoad
-(void)viewDidLoad
{
    [super viewDidLoad];
    // 设置导航栏的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    // 设置导航的标题button
    KXTitleButton *titleButton = [[KXTitleButton alloc]init];
    
      // 设置文字
       [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    
    [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      // 设置图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
      // 设置背景
    [titleButton setBackgroundImage:[UIImage imageNamed:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    // 设置尺寸
    titleButton.width = 100;
    titleButton.height = 35;
    // 设置监听事件
    [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}
#pragma mark - 监听titleButton
-(void)titleButtonClick:(UIButton*)titleButton
{
    if(!self.isDown)
    {
        // 箭头向上
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        self.isDown = YES;
        
        // 显示菜单栏
        UIImageView *titleMenu = [[UIImageView alloc]init];
        titleMenu.size = CGSizeMake(150, 250);
    
        titleMenu.image = [UIImage resizedImage:@"timeline_retweet_background_os7@2x"];
        // 获取主窗口
        UIView *window = [UIApplication sharedApplication].keyWindow;
        // 添加一个全局的遮盖按钮
        UIButton *cover = [[UIButton alloc]init];
        cover.frame = window.bounds;
        // 清除颜色
        cover.backgroundColor = [UIColor clearColor];
        cover.alpha = 0.2;
        [window addSubview:cover];
        
        // 设置可交互
        titleMenu.userInteractionEnabled = YES;
        titleMenu.centerX = window.width *0.5 - 50;
        titleMenu.y =55;
        [window addSubview:titleMenu];
    
    
    }else
    {
        // 箭头向下
      
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
          self.isDown = NO;
    }
}

#pragma mark - pop
-(void)pop
{
    MyLog(@"------pop-------");
}

#pragma mark - 跳转到朋搜索
-(void)friendSearch
{
    KXOneViewController *one = [[KXOneViewController alloc]init];
    
    one.title = @"One";
    [self.navigationController pushViewController:one animated:YES];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"homeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d --- 首页测试数据",indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     // 点击了cell的时候,跳转到下个页面
    UIViewController *newVc = [[UIViewController alloc]init];
    newVc.title = @"新控制器";
    newVc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:newVc animated:YES];
}


@end
