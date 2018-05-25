//
//  GXZCollectionViewCell.m
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import "GXZCollectionViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation GXZCollectionViewCell

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self.contentView addSubview:self.imgView];
    
    self.imgView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
    self.contentView.backgroundColor = [UIColor grayColor];
}


@end
