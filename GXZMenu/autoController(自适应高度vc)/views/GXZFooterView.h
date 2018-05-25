//
//  GXZFooterView.h
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GXZFooterView : UIView
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,strong) NSMutableArray * imageList;
@property (nonatomic,strong) UIImageView * videoPlacdolerImg;
@property (nonatomic,strong) UIButton * playerBtn;
@property (nonatomic,strong) UIViewController * delegate;
@end
