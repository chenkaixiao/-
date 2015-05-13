//
//  KXMessageViewController.m
//  WeiBo
//
//  Created by zero on 15/3/30.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXMessageViewController.h"

@interface KXMessageViewController ()

@end

@implementation KXMessageViewController

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
    
    // 设置右上角的BarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写信息" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem.enabled = NO;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%d --- 消息测试数据",indexPath.row];
    
    
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
