//
//  ViewController.m
//  CellAutoHeight
//
//  Created by 朱晓峰 on 2018/1/8.
//  Copyright © 2018年 朱晓峰. All rights reserved.
//

#import "ViewController.h"
#import "AutoTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AutoTableViewCellDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,copy)NSString * contentStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubView];
}

-(void)loadSubView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[AutoTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.tableView = tableView;
    cell.indexPath = indexPath;
    cell.contentStr = _contentStr;
    cell.delegate = self;
    return  cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(void)updatedContentText:(NSString *)text indexPath:(NSIndexPath *)index{
    _contentStr = text;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AutoTableViewCell * cell = (AutoTableViewCell*)[tableView.dataSource tableView:_tableView cellForRowAtIndexPath:indexPath];
    if (cell) {
        return  [cell CellHeight]<44 ? 44: [cell CellHeight];
    }
    return 0;
}
@end
