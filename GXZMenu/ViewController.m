//
//  ViewController.m
//  GXZMenu
//
//  Created by Deeokay on 2017/12/21.
//  Copyright © 2017年 GXZ. All rights reserved.
//

#import "ViewController.h"
#import "GXZMenu.h"
#import "UIView+SDAutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    NSMutableArray * lsit = [[NSMutableArray alloc] init];
    [lsit addObject:@"距离最近"];
    [lsit addObject:@"价格排序"];
    [lsit addObject:@"星级"];
    GXZMenu * menu = [[GXZMenu alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height - 20) withTitleList:lsit];
    [self.view addSubview:menu];
}
@end
