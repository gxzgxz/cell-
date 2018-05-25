//
//  HeadOneView.m
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import "HeadOneView.h"
#import "UIView+SDAutoLayout.h"

@interface HeadOneView ()



@end

@implementation HeadOneView
-(UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc] init];
        _headImg.image = [UIImage imageNamed:@"test0"];
        
    }
    return _headImg;
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.font = [UIFont systemFontOfSize:10];
        _nameLab.textColor = [UIColor grayColor];
        _nameLab.text = @"friend";
    }
    return _nameLab;
}

-(UIButton *)guanBtn{
    if (!_guanBtn) {
        _guanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _guanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_guanBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _guanBtn.layer.cornerRadius = 10;
        _guanBtn.layer.borderWidth = 1;
        _guanBtn.layer.borderColor = [UIColor orangeColor].CGColor;
        _guanBtn.layer.masksToBounds = YES;
    }
    return _guanBtn;
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.font = [UIFont systemFontOfSize:10];
        _timeLab.textColor = [UIColor lightGrayColor];
        _timeLab.text = @"03-10  09:09:09";
    }
    return _timeLab;
}

-(UIButton *)zanBtn{
    if (!_zanBtn) {
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setTitle:@"1025" forState:UIControlStateNormal];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_zanBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _zanBtn;
}
-(UIButton *)huoBtn{
    if (!_huoBtn) {
        _huoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_huoBtn setTitle:@"1330" forState:UIControlStateNormal];
        _huoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_huoBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _huoBtn;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
    [self addSubview:self.headImg];
    [self addSubview:self.nameLab];
    [self addSubview:self.guanBtn];
    [self addSubview:self.timeLab];
    [self addSubview:self.huoBtn];
    [self addSubview:self.zanBtn];
    [_guanBtn setTitle:@"+关注" forState:UIControlStateNormal];
    [_guanBtn setTitle:@"已关注" forState:UIControlStateSelected];
    [_guanBtn addTarget:self action:@selector(tapGuanzhuBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.headImg.sd_layout.leftSpaceToView(self, 15)
    .centerYEqualToView(self)
    .widthIs(50)
    .heightIs(50);
    
    self.headImg.layer.cornerRadius = 25;
    self.headImg.layer.masksToBounds = YES;
    
    self.nameLab.sd_layout
    .leftSpaceToView(_headImg, 10)
    .heightIs(15).topEqualToView(_headImg);
    _nameLab.backgroundColor = [UIColor purpleColor];
    [_nameLab setSingleLineAutoResizeWithMaxWidth:200];
    
    self.guanBtn.sd_layout.centerYEqualToView(_nameLab)
    .leftSpaceToView(_nameLab, 15)
    .heightIs(20)
    .widthIs(50);
    
    self.timeLab.sd_layout.bottomEqualToView(_headImg)
    .leftSpaceToView(_headImg, 10)
    .heightIs(20);
    [_timeLab setSingleLineAutoResizeWithMaxWidth:200];
    
    self.huoBtn.sd_layout.bottomEqualToView(_timeLab)
    .rightSpaceToView(self, 20)
    .heightIs(20)
    .widthIs(50);
    _huoBtn.backgroundColor = [UIColor purpleColor];
    
    self.zanBtn.sd_layout.bottomEqualToView(_timeLab)
    .rightSpaceToView(_huoBtn, 20)
    .heightIs(20)
    .widthIs(50);
    _zanBtn.backgroundColor = [UIColor purpleColor];
    
}
-(void)tapGuanzhuBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        
        
    }else{
        
        
    }
    
}




@end
