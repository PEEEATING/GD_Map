//
//  MapTypeViewController.m
//  GD_Map
//
//  Created by EATING on 2017/2/14.
//  Copyright © 2017年 EATING. All rights reserved.
//

#import "MapTypeViewController.h"
#import "tableViewController.h"
@implementation MapTypeViewController


-(void )viewDidLoad{

    [super viewDidLoad];
    

    self.navigationItem.title = @"GD_Map";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(jumpToSetting)];
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    ///把地图添加至view
    [self.view addSubview:_mapView];
    
    //定位小蓝点
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;

}

-(void)jumpToSetting{
    

    tableViewController *setting = [[tableViewController alloc]init];
    
    [self.navigationController pushViewController:setting animated:YES];

}


@end
