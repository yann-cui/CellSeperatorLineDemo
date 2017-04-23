//
//  ViewController.m
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import "ViewController.h"
#import "BaseCell+Line.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.datas =@[@"apple",@"orange",@"banana",@"..."];
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    tbView.delegate  = self;
    tbView.dataSource = self;
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    [BaseCell registerForTableView:tbView];
    [self.view addSubview:tbView];
    
    self.tableView = tbView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44.;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [BaseCell newInstanceWithDef];
    }
    [cell clearBackview];
    [cell customBackgroundView:tableView separatorInset:(UIEdgeInsetsMake(0, 12, 0, 12))];
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
