//
//  GXZTableViewCell.h
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXZModel.h"
@interface GXZTableViewCell : UITableViewCell
@property (nonatomic,strong) GXZModel * model;
@property (nonatomic,strong) UIViewController * delegate;
@end
