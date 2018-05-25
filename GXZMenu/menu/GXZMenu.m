//
//  GXZMenu.m
//  GXZMenu
//
//  Created by Deeokay on 2017/12/21.
//  Copyright © 2017年 GXZ. All rights reserved.
//

#import "GXZMenu.h"
#import "UIView+SDAutoLayout.h"
@interface GXZMenu()
@property (nonatomic,strong) UIView * btnMenuView;
@end
@implementation GXZMenu

-(UIView *)btnMenuView{
    if (!_btnMenuView) {
        _btnMenuView = [[UIView alloc] init];
    }
    return _btnMenuView;
}

-(instancetype)initWithFrame:(CGRect)frame withTitleList:(NSMutableArray *)titleList{

    self = [super initWithFrame:frame];
    if (self) {
        [self gxzSetUIWithFrame:frame withTitleList:titleList];
    }
    return self;
}

-(void)gxzSetUIWithFrame:(CGRect)frame withTitleList:(NSMutableArray *)titleList{
    [self addSubview:self.btnMenuView];
    self.btnMenuView.backgroundColor = [UIColor purpleColor];
    _btnMenuView.sd_layout
    .leftSpaceToView(self, 0)
    .topSpaceToView(self, 10)
    .rightSpaceToView(self, 0)
    .heightIs(50);
    CGFloat width = self.bounds.size.width/titleList.count;
    NSLog(@"width:%f",width);
    for (int i = 0; i<titleList.count; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width*i, 0, width, _btnMenuView.frame.size.height);
        [btn setTitle:titleList[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = i;
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_btnMenuView addSubview:btn];
    }
}
-(void)tapBtn:(UIButton *)sender{
    self.sd_layout
    .topSpaceToView(self.superview, 0)
    .leftSpaceToView(self.superview, 0)
    .rightSpaceToView(self.superview, 0)
    .autoHeightRatio(10);
    [self updateLayout];
 
}
@end
