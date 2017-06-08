//
//  ViewController.m
//  ZQ_GoodsDetailAnimation
//
//  Created by hzq on 2017/6/7.
//  Copyright © 2017年 zq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UIView * headerBackview;
@property(nonatomic,weak)UIImageView * headerView;
@property(nonatomic,weak)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView * headerBackview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    self.headerBackview = headerBackview;
    tableView.tableHeaderView= headerBackview;
    
    UIImageView * headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    [headerBackview addSubview:headerView];
    self.headerView = headerView;
    headerView.image = [UIImage imageNamed:@"tooopen_sy_127457023651.jpeg"];
    
    [tableView insertSubview:self.headerBackview atIndex:0];
    
    

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.backgroundColor = [UIColor cyanColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offset = scrollView.contentOffset.y;
     CGRect frame = self.headerView.frame;
    if (offset<0) {
        frame.origin.y = offset;
        frame.size.height = self.view.frame.size.width - offset;
        frame.origin.x = offset/2;
        frame.size.width = self.view.frame.size.width - offset;
    }else{
       
        frame.origin.y = offset/2;
       
    }
     self.headerView.frame = frame;
        [self.tableView insertSubview:self.headerBackview atIndex:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
