//
//  HomeViewController.m
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

#import "HomeViewController.h"
#import "RunTimeController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
/**  控制器的名称*/
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation HomeViewController

- (NSArray *)controllers{
    if (!_controllers) {
        _controllers = [[NSArray alloc]initWithObjects:[[RunTimeController alloc] initWithTitle:@"RunTime"],nil];
    }
    return _controllers;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}

#pragma mark -----tableView delegate && tableView dataSource -------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (!IsArrEmpty(self.controllers)) {
        UIViewController *viewController = self.controllers[indexPath.row];
        cell.textLabel.text = viewController.title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (!IsArrEmpty(self.controllers)) {
        UIViewController *viewController = self.controllers[indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
