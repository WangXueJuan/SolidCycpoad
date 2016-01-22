//
//  SolidesFriendsViewController.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/21.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "SolidesFriendsViewController.h"
#import "VOSegmentedControl.h"
#import "PullingRefreshTableView.h"
#import "FriendsTableViewCell.h"
#import "Solids.pch"
@interface SolidesFriendsViewController ()<UITableViewDataSource, UITableViewDelegate, PullingRefreshTableViewDelegate>
{
    NSInteger _pageCount;
}
@property(nonatomic, assign) BOOL canRefreshing;
@property(nonatomic, strong) PullingRefreshTableView *tableView;
@end

@implementation SolidesFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pageCount = 1;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"FriendsTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView launchRefreshing];

    //导航栏按钮
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addLoginAction:)];
    rightBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItems = @[rightBar];
    
    //请求网络
    [self getRequest];
    
}


#pragma mark ---------- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendsTableViewCell *friendCell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    //点击单元格颜色不变
    friendCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return friendCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

#pragma mark ---------------- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




//请求网络
- (void)getRequest{
    
    AFHTTPSessionManager *httpManger = [AFHTTPSessionManager manager];
    httpManger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [httpManger GET:[NSString stringWithFormat:@"%@page=%ld", kSolidesFriends, _pageCount] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        YWMLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YWMLog(@"%@", error);
    }];
    
    
    
    
    
}

#pragma mark ----- PullingTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView{
    _pageCount = 1;
    self.canRefreshing = YES;
    [self performSelector:@selector(getRequest) withObject:nil afterDelay:1.0];
}
//下拉刷新
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
    _pageCount += 1;
    [self performSelector:@selector(getRequest) withObject:nil afterDelay:1.0];
}

//刷新完成
- (NSDate *)pullingTableViewRefreshingFinishedDate{
    return [HWTools getSystemNowDate];
}

//手指拖动开始
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.tableView tableViewDidScroll:scrollView];
}
- (void)addLoginAction:(UITabBarItem *)bar{
    
}

#pragma mark --------- lazyLoading
- (PullingRefreshTableView *)tableView{
    if (!_tableView) {
         self.tableView = [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(5, 40, kWidth - 10, kHeight - 120) pullingDelegate:self];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.rowHeight = 200;
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
