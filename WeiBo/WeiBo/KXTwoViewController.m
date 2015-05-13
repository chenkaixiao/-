//
//  KXTwoViewController.m
//  WeiBo
//
//  Created by zero on 15/3/31.
//  Copyright (c) 2015年 ckx. All rights reserved.
//

#import "KXTwoViewController.h"
#import "KXThreeViewController.h"

@interface KXTwoViewController ()
- (IBAction)jumpToThreeVC:(id)sender;

@end

@implementation KXTwoViewController

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

- (IBAction)jumpToThreeVC:(id)sender {
    
    KXThreeViewController *three = [[KXThreeViewController alloc]init];
    three.title = @"Three";
    [self.navigationController pushViewController:three animated:YES];
}
@end
