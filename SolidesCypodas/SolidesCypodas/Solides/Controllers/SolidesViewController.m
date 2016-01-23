//
//  SolidesViewController.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/21.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "SolidesViewController.h"
#import "SolidesModel.h"
#import "SolidesTableViewCell.h"
#import "AFHTTPSessionManager.h"
#import "PrefixHeader.pch"
#import "PullingRefreshTableView.h"
#import "HWTools.h"

@interface SolidesViewController ()<UITableViewDataSource, UITableViewDelegate, PullingRefreshTableViewDelegate>
{
    //定义请求的页码
    NSInteger _pageCount;
}

//存放全部数据的数组
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) PullingRefreshTableView *tableView;
@property (nonatomic, assign) BOOL refreshing;


@end

@implementation SolidesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"SolidesTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

    [self.view addSubview:self.tableView];
    //请求网络数据
    [self getRequestModel];
    
    
    
    
    
    
}


#pragma mark ------------------------- 请求网络数据
- (void)getRequestModel{
    AFHTTPSessionManager *sessionManger = [AFHTTPSessionManager manager];
    sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [sessionManger GET:kSolidesSpecial parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        NSArray *array = dic[@"items"];
        for (NSDictionary *dict in array) {
            SolidesModel *modell = [[SolidesModel alloc] initWithDictionary:dict];
            [self.listArray addObject:modell];
        }
//        self.listArray = self.contextArray;
//        WXJLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
       
    }];



}

#pragma mark --------------------------- UITableViewDataSource

//重用机制
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SolidesTableViewCell *solidCell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    solidCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    SolidesModel *model = self.listArray[indexPath.row];
    solidCell.solidesModel = model;
    
    
    return solidCell;
    
}




//返回分区行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WXJLog(@"%ld",self.listArray.count);
    return self.listArray.count;
}



#pragma mark --------------------------- UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}



#pragma mark --------------------------- 懒加载
-(NSMutableArray *)listArray{
    if (_listArray == nil) {
        self.listArray = [NSMutableArray new];
    }
    return _listArray;

}

//懒加载
-(PullingRefreshTableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 50) pullingDelegate:self];
        self.tableView.delegate = self;
        self.tableView.dataSource  =self;
        self.tableView.rowHeight = 180;
        
    }
    return _tableView;
    
}

#pragma mark -------------------------------- PullingRefreshTableView

//下拉刷新
-(void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView{
    _pageCount = 1;
    self.refreshing = YES;
    [self performSelector:@selector(getRequestModel) withObject:nil afterDelay:1.0];
    
}

//上拉加载
-(void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
   
        _pageCount += 1;
        self.refreshing = NO;
        [self performSelector:@selector(getRequestModel) withObject:nil afterDelay:1.0];
   
}

//获取当前时间
-(NSDate *)pullingTableViewRefreshingFinishedDate{
    return [HWTools getSystemNowDate];
    
}
//手指开始拖动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.tableView tableViewDidScroll:scrollView];
    
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
