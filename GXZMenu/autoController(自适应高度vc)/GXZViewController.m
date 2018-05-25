//
//  GXZViewController.m
//  GXZMenu
//
//  Created by Deeokay on 2018/5/17.
//  Copyright © 2018年 GXZ. All rights reserved.
//

#import "GXZViewController.h"
#import "GXZTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "GXZModel.h"
#import "HJVideoPlayerController.h"

@interface GXZViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tab;
@property (nonatomic,strong) NSMutableArray <GXZModel *> * modelList;
@end

@implementation GXZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configModel];
    [self setUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pl) name:@"play" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)pl{
    HJVideoPlayerController * videoC = [[HJVideoPlayerController alloc] init];
    [videoC.configModel setOnlyFullScreen:YES];
    [videoC setUrl:@"http://hc31.aipai.com/user/128/31977128/1006/card/44340096/card.mp4?l=f"];
    [self.navigationController pushViewController:videoC animated:YES];
}

-(void)setUI{
    _tab = [[UITableView alloc] init];
    _tab.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _tab.delegate = self;
    _tab.dataSource = self;
    [_tab registerClass:[GXZTableViewCell class] forCellReuseIdentifier:@"GXZTableViewCell"];
    [self.view addSubview:_tab];
}

-(void)configModel{
    GXZModel * one = [[GXZModel alloc] init];
    one.content = @"2015年国家发布了《中国制造2025》计划是工业互联网的引子，去年11月底国务院印发《关于深化“互联网+先进制造业”发展工业互联网的指导意见》，进一步强调了以工业互联网为抓手，大力实施“中国制造2025”和“互联网+”行动，明确将工业互联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one.type = 1;
    one.list = @[[UIImage imageNamed:@"pic0"],[UIImage imageNamed:@"pic1"],[UIImage imageNamed:@"pic2"],[UIImage imageNamed:@"pic3"],[UIImage imageNamed:@"pic4"],[UIImage imageNamed:@"pic5"]];
    one.name = @"liuyifei0";
    one.guanType = 0;
    
    GXZModel * one1 = [[GXZModel alloc] init];
    one1.content = @"2015年国家发布了《中国制造2025》计划是工业互联网的引子，去年11月底国务院印发《关于深化“互联网+先进制造业”发展工业互联网的指导意见》，互联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one1.type = 0;
    one1.list = @[[UIImage imageNamed:@"pic0"],[UIImage imageNamed:@"pic1"],[UIImage imageNamed:@"pic2"]];
    one1.name = @"liuyifei1";
    one1.videoImgStr = @"pic5";
    one1.guanType = 1;
    
    GXZModel * one2 = [[GXZModel alloc] init];
    one2.content = @"2015年国家发布了《中国制造2025》计划是工业互联网的引子，去年11月底国务院印发《关于深化“互联网+先进制造业”发展工业互联网的指导意见》，进一步强调了以工业互联网为抓手，大力实施“中国明确将工业互联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one2.type = 1;
    one2.list = @[[UIImage imageNamed:@"pic0"],[UIImage imageNamed:@"pic1"]];
    one2.name = @"liuyifei2";
    one2.guanType = 1;
    
    GXZModel * one3 = [[GXZModel alloc] init];
    one3.content = @"2015年国家发布了《中国制造2025》计年11月底国务院印发《关于深化“互联网++”行动，明确将工业互联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one3.type = 1;
    one3.list = @[];
    one3.name = @"liuyifei3";
    one3.guanType = 0;
    
    GXZModel * one4 = [[GXZModel alloc] init];
    one4.content = @"2015年国家发布了《中国制造20印发《关于深化“互联网+先进制造业”发展工业互联网的指导意见》，进一步强调了以工业互联网为抓手，大力实施“中国制造2025”和“互联网+”行动，明确将工业互联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one4.type = 1;
    one4.list = @[[UIImage imageNamed:@"pic0"]];
    one4.name = @"liuyifei4";
    one4.guanType = 0;
    
    GXZModel * one5 = [[GXZModel alloc] init];
    one5.content = @"2015年国家发布了《中国方向，成为中国工业互联网的行动纲领";
    one5.type = 0;
    one5.list = @[];
    one5.name = @"liuyifei5";
    one5.videoImgStr = @"pic5";
    one5.guanType = 0;
    
    GXZModel * one6 = [[GXZModel alloc] init];
    one6.content = @"2015年国家发布了《中国联网作为中国制造2025的主攻方向，成为中国工业互联网的行动纲领";
    one6.type = 1;
    one6.list = @[[UIImage imageNamed:@"pic0"],[UIImage imageNamed:@"pic1"],[UIImage imageNamed:@"pic2"],[UIImage imageNamed:@"pic3"],[UIImage imageNamed:@"pic4"],[UIImage imageNamed:@"pic5"]];
    one6.name = @"liuyifei6";
    one6.guanType = 0;
    
    
    self.modelList = [[NSMutableArray alloc] init];
    [self.modelList addObject:one];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    [self.modelList addObject:one6];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    
    [self.modelList addObject:one];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    [self.modelList addObject:one6];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    [self.modelList addObject:one1];
    [self.modelList addObject:one2];
    [self.modelList addObject:one3];
    [self.modelList addObject:one4];
    [self.modelList addObject:one5];
    
    [self.modelList addObject:one];
    [self.modelList addObject:one];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"count:%ld",_modelList.count);
    return _modelList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GXZTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GXZTableViewCell"];
    cell.model = self.modelList[indexPath.row];
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.modelList[indexPath.row];
    return [self.tab cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[GXZTableViewCell class] contentViewWidth:[self cellContentViewWith]];
    
}
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
@end
