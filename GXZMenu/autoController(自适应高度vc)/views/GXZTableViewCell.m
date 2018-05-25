//
//  GXZTableViewCell.m
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import "GXZTableViewCell.h"
#import "HeadOneView.h"
#import "GXZFooterView.h"

#import "UIView+SDAutoLayout.h"

@interface GXZTableViewCell ()

@property (nonatomic,strong) HeadOneView * headView;
@property (nonatomic,strong) UILabel * contentLab;
@property (nonatomic,strong) GXZFooterView * footerView;
@end

@implementation GXZTableViewCell

-(HeadOneView *)headView{
    if (!_headView) {
        _headView = [[HeadOneView alloc] init];
    }
    return _headView;
}
-(GXZFooterView *)footerView{
    if (!_footerView) {
        _footerView = [[GXZFooterView alloc] init];
    }
    return _footerView;
}
-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.textColor = [UIColor lightGrayColor];
        _contentLab.numberOfLines = 0;
//        _contentLab.text = @"上图为整改措施原文的截图，文字比较小，但是应该还是能够看清楚的。其中主要分为以下几个模块的内容顺风车整改措施：可以看出顺风车整改措施是最具体的，其中提到了人脸识别技术的使用以及社交功能的下线，其中人脸识别针对司机私下交换账号了对平台行业务的调整：整改措施也很具体，并作出了承诺还建立了关爱基金；面向广大用户的提问：现在人们对于隐私以及安全问题都很关注，然而有时候隐私和安全是相互冲突的严格筛选司机背景会导致安全和就业权突。因此上面提到的两个问题确实不是很好处理，将这些问题留给公众是比较恰当的做法，可以有效防止公司做出错误的判断。";
    }
    return _contentLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];



}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    
    return self;
}

-(void)setUI{
    [self.contentView addSubview:self.headView];
    [self.contentView addSubview:self.contentLab];
//    [self.contentView addSubview:self.footerView];
    
    self.headView.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(60);
    
    self.contentLab.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(_headView, 10)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    _contentLab.backgroundColor = [UIColor purpleColor];
    
  
    
//    NSMutableArray *imageli = [[NSMutableArray alloc] initWithArray:@[[UIImage imageNamed:@"pic0"],[UIImage imageNamed:@"pic1"],[UIImage imageNamed:@"pic2"],[UIImage imageNamed:@"pic3"],[UIImage imageNamed:@"pic4"],[UIImage imageNamed:@"pic5"]]];
//
//
//    _footerView.imageList = imageli;

//    [self setupAutoHeightWithBottomView:_footerView bottomMargin:15];
}
-(void)setModel:(GXZModel *)model{
    _model = model;
    _contentLab.text = model.content;
    _headView.nameLab.text = model.name;
    UIView * lastView;
    if (model.guanType == 0) {
        [_headView.guanBtn setSelected:false];
    }else{
        [_headView.guanBtn setSelected:YES];
    }

    if (model.type == 0) {//表示是视频
        [self.contentView addSubview:self.footerView];
      
        _footerView.type = model.type;
        _footerView.delegate = _delegate;
        lastView = _footerView;
        self.footerView.sd_layout
        .topSpaceToView(_contentLab, 10)
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(([UIScreen mainScreen].bounds.size.width-30-6)/3*2);
        _footerView.videoPlacdolerImg.image = [UIImage imageNamed:model.videoImgStr];
        
    }else if (model.type == 1){//表示图片
   
        if (model.list.count == 0) {
            lastView = _contentLab;
            self.footerView.sd_layout
            .topSpaceToView(_contentLab, 10)
            .leftEqualToView(self.contentView)
            .rightEqualToView(self.contentView)
            .heightIs(0);
        }else{
            [self.contentView addSubview:self.footerView];
            _footerView.type = model.type;
            _footerView.delegate = _delegate;
            lastView = _footerView;
            if (model.list.count<=3) {
                self.footerView.sd_layout
                .topSpaceToView(_contentLab, 10)
                .leftEqualToView(self.contentView)
                .rightEqualToView(self.contentView)
                .heightIs(([UIScreen mainScreen].bounds.size.width-30-6)/3);
            }else{
                self.footerView.sd_layout
                .topSpaceToView(_contentLab, 10)
                .leftEqualToView(self.contentView)
                .rightEqualToView(self.contentView)
                .heightIs(([UIScreen mainScreen].bounds.size.width-30-6)/3*2);
            }
            _footerView.imageList = (NSMutableArray *)model.list;
        }
    }
    [self setupAutoHeightWithBottomView:lastView bottomMargin:15];
}

@end
