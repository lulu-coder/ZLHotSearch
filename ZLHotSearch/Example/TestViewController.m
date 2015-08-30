//
//  TestViewController.m
//  ZLHotSearch
//
//  Created by 张璐 on 15/8/30.
//  Copyright (c) 2015年 张璐. All rights reserved.
//

#import "TestViewController.h"
#import "ZLHotSearchView.h"
@interface TestViewController ()<ZLHotSearchViewDelegate>
@property (nonatomic,strong) NSArray * hotTextArray;
@end

@implementation TestViewController

-(NSArray *)hotTextArray
{
    if (!_hotTextArray) {
        
        self.hotTextArray = @[@"惠人",@"双立人",@"爱仕达",@"保湿",@"收纳",@"富安娜",@"韩束",@"美的",@"苏泊尔",@"七格格",@"韩都衣舍",@"阔色",@"香奈儿",@"美宝莲"];
    }
    return _hotTextArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZLHotSearchView * hotView = [[ZLHotSearchView alloc] init];
    hotView.frame = CGRectMake(0,20,self.view.frame.size.width, 200);
    hotView.contentArray = self.hotTextArray;
    hotView.contentBackgroundImage = @"bg_label_keyword";
    hotView.delegate = self;
    [self.view addSubview:hotView];
    
    
}
//代理方法
-(void)hotSearchView:(ZLHotSearchView *)hotSearchView contentText:(NSString *)contentText
{
    
}
@end
