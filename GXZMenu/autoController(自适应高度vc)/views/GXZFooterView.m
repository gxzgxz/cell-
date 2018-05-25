//
//  GXZFooterView.m
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import "GXZFooterView.h"
#import "UIView+SDAutoLayout.h"
#import "GXZCollectionViewCell.h"
#import "SDPhotoBrowser.h"
@interface GXZFooterView ()<UICollectionViewDelegate,UICollectionViewDataSource,SDPhotoBrowserDelegate>

@property (nonatomic,strong) UIView * videoView;
@property (nonatomic,strong) UICollectionView * imageColView;
//@property (nonatomic,strong) SDPhotoBrowser * brower;

@end

@implementation GXZFooterView
//-(SDPhotoBrowser *)brower{
//    if (!_brower) {
//        _brower = [[SDPhotoBrowser alloc] init];
//    }
//    return _brower;
//}

-(UIImageView *)videoPlacdolerImg{
    if (!_videoPlacdolerImg) {
        _videoPlacdolerImg = [[UIImageView alloc] init];
    }
    return _videoPlacdolerImg;
}

-(UIButton *)playerBtn{
    if (!_playerBtn) {
        _playerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playerBtn setImage:[UIImage imageNamed:@"video_play"] forState:UIControlStateNormal];
    }
    return _playerBtn;
}

-(UIView *)videoView{
    if (!_videoView) {
        _videoView = [[UIView alloc] init];
    }
    return _videoView;
}
-(UICollectionView *)imageColView{
    if (!_imageColView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];

        _imageColView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _imageColView.scrollEnabled = false;
    }
    return _imageColView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    [self addSubview:self.videoView];
    [self addSubview:self.imageColView];
    
    _imageColView.delegate = self;
    _imageColView.dataSource = self;
    _imageColView.backgroundColor = [UIColor whiteColor];
    [_imageColView registerClass:[GXZCollectionViewCell class] forCellWithReuseIdentifier:@"GXZCollectionViewCell"];
   
    self.videoView.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .bottomEqualToView(self);
    _videoView.backgroundColor = [UIColor orangeColor];
    [self.videoView addSubview:self.videoPlacdolerImg];
    [self.videoView addSubview:self.playerBtn];
    
    _videoPlacdolerImg.sd_layout
    .topSpaceToView(_videoView, 0)
    .leftEqualToView(_videoView)
    .rightEqualToView(_videoView)
    .bottomEqualToView(_videoView);
    
    _playerBtn.sd_layout
    .centerXEqualToView(_videoView)
    .centerYEqualToView(_videoView)
    .widthIs(50)
    .heightIs(50);
    
    
    self.imageColView.sd_layout
    .topEqualToView(self)
    .leftSpaceToView(self, 15)
    .rightSpaceToView(self, 15)
    .bottomEqualToView(self);
    
    [_playerBtn addTarget:self action:@selector(tapPlayBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setType:(NSInteger)type{
    _type = type;
    if (type == 0) {
        self.videoView.hidden = false;
        self.videoPlacdolerImg.hidden = false;
        self.playerBtn.hidden = false;
        self.imageColView.hidden = YES;
    }else{
        self.videoView.hidden = YES;
        self.videoPlacdolerImg.hidden = YES;
        self.playerBtn.hidden = YES;
        self.imageColView.hidden = false;
    }
}
-(void)tapPlayBtn{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"play" object:nil];
}
-(void)setImageList:(NSMutableArray *)imageList{
    _imageList = imageList;
    NSLog(@"imagelis:%ld",imageList.count);
    [_imageColView reloadData];
//    self.brower.sourceImagesContainerView = self;
//    _brower.imageCount = _imageList.count;
//    NSLog(@"ccc:%ld",_imageList.count);
//    _brower.delegate = self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GXZCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GXZCollectionViewCell" forIndexPath:indexPath];
    cell.imgView.image = _imageList[indexPath.row];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-30-6)/3, ([UIScreen mainScreen].bounds.size.width-30-6)/3);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self creatPic:indexPath.row];
}

-(void)creatPic:(NSInteger)index{
    
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = index;
    browser.sourceImagesContainerView = self.imageColView;
    browser.imageCount = _imageList.count;
    browser.delegate = self;
    [browser show];
    
}

#pragma mark - SDPhotoBrowserDelegate

//- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
//{
//    NSString *imageName = self.picPathStringsArray[index];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:nil];
//    return url;
//}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return _imageList[index];
}




@end
