//
//  KXNewFeatureViewController.m
//  WeiBo
//
//  Created by zero on 15/3/31.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXNewFeatureViewController.h"
#import "KXTabBarViewController.h"
#define  KXNewFeathureImagecount 4

@interface KXNewFeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation KXNewFeatureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpScrollView];
    
    [self setUpPageController];
};

#pragma mark -添加UIScrollView
-(void)setUpScrollView
{
    // 1 添加 Uiscrollview
    // 创建
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    // 设置代理
    scrollView.delegate = self;
    // 添加到view
    [self.view addSubview:scrollView];
    
    // 2 添加图片
    // 设置每张图片的宽高和scrollview的一致
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    
    // 添加四张图片
    for(int i = 0;i< KXNewFeathureImagecount;i++)
    {
        UIImageView *imageView =[[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor greenColor];
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        
        // 判断是否四寸屏幕
        if(FourInch)
        {
            name=[name stringByAppendingString:@"@2x"];
        }
        imageView.image = [UIImage imageNamed:name];
        
        // 把imageView添加到scrollView上
        [scrollView addSubview:imageView];
        
        // 设置imageView的frame
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i *imageW;
        
        if(i == KXNewFeathureImagecount -1)
        {
            [self setUplastImageView:imageView];
        }
    }
    
    // 设置其他的属性
    // 设置活动范围
    scrollView.contentSize = CGSizeMake(KXNewFeathureImagecount*imageW, 0);
    
    // 设置背景颜色
    scrollView.backgroundColor = KXColor(246, 246, 246);
    // 隐藏了水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    // 去除弹簧效果
    scrollView.bounces = NO;
}
#pragma mark - 设置最后ImageView，在上面添加两个按钮
-(void)setUplastImageView:(UIImageView*)imageView
{
    // 设置为空交互的
    imageView.userInteractionEnabled = YES;
//    imageView.image = [UIImage imageNamed:@"new_feature_3"];
    // 1 添加开始微博按钮
    [self setUpStartBtn:imageView];
    // 2 添加分享按钮
    [self setUpShareBtn:imageView];
    
}
#pragma mark - 开始微博按钮
-(void)setUpStartBtn:(UIImageView*)imageView
{
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc] init];
    [imageView addSubview:startButton];
    
    // 2.设置背景图片
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置frame
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.centerX = self.view.width * 0.5;
    //注意：这是为了适配3.5inch和4.0inch
    startButton.centerY = self.view.height * 0.8;
    
    // 4.设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)start
{
    
    //显示主控制器
    KXTabBarViewController *vc=[[KXTabBarViewController alloc]init];
    
    //切换控制器(3)
    //push(当前没有导航控制器，但是可以添加一个)
    //    [self.navigationController pushViewController:vc animated:NO];
    //modal
    //    [self presentViewController:vc animated:NO completion:Nil];
    //window.rootViewController
    // self.view.window注意，不要用这种方法去获取主窗口
    [UIApplication sharedApplication].keyWindow.rootViewController=vc;
}
#pragma mark - 开始分享按钮
-(void)setUpShareBtn:(UIImageView*)imageView
{
    //1.创建并添加分享按钮
    UIButton *shareButton=[[UIButton alloc]init];
    [imageView addSubview:shareButton];
    
    //2.设置文字和图片等信息
    [shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    //监听点击事件
    [shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    //3.设置按钮的frame
    shareButton.size=CGSizeMake(150, 35);
    shareButton.centerX=self.view.width*0.5;
    shareButton.centerY=self.view.height*0.7;
    
    //4.设置间距
    shareButton.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
}
-(void)share:(UIButton *)shareButton
{
    //对状态进行取反
    shareButton.selected=!shareButton.isSelected;
}
#pragma mark - 添加UIPageController
-(void)setUpPageController
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    // 设置一共有几页
    pageControl.numberOfPages = KXNewFeathureImagecount;
    // 设置显示的位置
    pageControl.centerX = self.view.width*0.5;
    pageControl.centerY = self.view.height - 30;
    // 加入page
    [self.view addSubview:pageControl];
    
    // 设置圆点的颜色
    // 当前
    pageControl.currentPageIndicatorTintColor = KXColor(253, 98, 42);
    // 其他
    pageControl.pageIndicatorTintColor = KXColor(189, 189, 189);
    self.pageControl = pageControl;
}

#pragma mark - scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //拿到浮点数进行四舍五入
    double doublePage=scrollView.contentOffset.x/scrollView.width;
    int intPage=(int)(doublePage + 0.5);
    //设置当前页码
    self.pageControl.currentPage=intPage;
}
#pragma mark-隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)dealloc{
    self.pageControl = nil;
}
@end
