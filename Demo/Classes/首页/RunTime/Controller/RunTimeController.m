//
//  RunTimeController.m
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

#import "RunTimeController.h"
#import "RunTimeOneController.h"
#import "RunTimeTwoController.h"
@interface RunTimeController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSources;

@end

@implementation RunTimeController

- (NSArray *)dataSources{
    if (!_dataSources) {
        _dataSources = @[ [[RunTimeOneController alloc] initWithTitle:@"实现字典转模型的自动转换"],
                          [[RunTimeTwoController alloc] initWithTitle:@"实现NSCoding的自动归档和解档"]];
    }
    return _dataSources;
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
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (!IsArrEmpty(self.dataSources)) {
        UIViewController *viewController = self.dataSources[indexPath.row];
        cell.textLabel.text = viewController.title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (!IsArrEmpty(self.dataSources)) {
        UIViewController *viewController = self.dataSources[indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
