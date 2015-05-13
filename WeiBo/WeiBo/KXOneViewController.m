//
//  KXOneViewController.m
//  WeiBo
//
//  Created by zero on 15/3/31.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXOneViewController.h"
#import  "KXTwoViewController.h"
@interface KXOneViewController ()

- (IBAction)jumpToTwoVC:(id)sender;

@end

@implementation KXOneViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpToTwoVC:(id)sender {
    
    KXTwoViewController *two = [[KXTwoViewController alloc]init];
    two.title = @"two";
    [self.navigationController pushViewController:two animated:YES];
}
@end
