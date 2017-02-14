//
//  tableViewController.m
//  GD_Map
//
//  Created by EATING on 2017/2/14.
//  Copyright © 2017年 EATING. All rights reserved.
//

#import "tableViewController.h"
#import "MJRefreshNormalHeader.h"


@interface tableViewController ()<UITableViewDelegate,UITableViewDataSource>
    

@property (nonatomic,strong)  UITableView * table;

@end

@implementation tableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     _table = [[UITableView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    self.navigationItem.title = @"设置";

    _table.delegate = self;
    _table.dataSource = self;
    
    [self.view addSubview:_table];

    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{NSLog(@"正在刷新");
    
    [_table.mj_header endRefreshing];
    
    }];
//
//    [header setTitle:@"下拉" forState:MJRefreshStateIdle];
//    [header setTitle:@"松开" forState:MJRefreshStatePulling];
//    [header setTitle:@"freshing" forState:MJRefreshStateRefreshing];
//    header.lastUpdatedTime.accessibilityElementsHidden = YES;

    
    _table.mj_header = header;

}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 2;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{


    return 2;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"table";

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"个人设置";
        cell.detailTextLabel.text = @"个人设置细节";
    }
    else if (indexPath.row == 1)
    {
    
        cell.textLabel.text = @"偏好设置";
        cell.detailTextLabel.text = @"偏好设置细节";
    
    }
    else
    {
    
        cell.textLabel.text = @"其他设置";
        cell.detailTextLabel.text = @"其他设置细节";
    }
    
    
    

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 30;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"设置";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
