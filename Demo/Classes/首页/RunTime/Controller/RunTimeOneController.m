//
//  RunTimeOneController.m
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

#import "RunTimeOneController.h"
#import "ModelMovie.h"

@implementation RunTimeOneController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self testMovies];
}

- (void)testFriends{
    
    NSString * friendspath = [[NSBundle mainBundle]pathForResource:@"Friends" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:friendspath];
    NSLog(@"%@",arr);
    
}

- (void)testMovies{
    
    NSString * friendspath = [[NSBundle mainBundle]pathForResource:@"Movies" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:friendspath];
    NSLog(@"%@",dic);
    
    [ModelMovie objectWithDic:dic];
    
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
