//
//  GXZModel.h
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXZModel : NSObject
@property (nonatomic,copy) NSString * content;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,strong) NSArray * list;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * videoImgStr;
@property (nonatomic,assign) NSInteger guanType;//0 未关注 1 已关注

@end
