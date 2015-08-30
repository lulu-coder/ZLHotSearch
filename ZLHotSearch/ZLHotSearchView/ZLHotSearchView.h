//
//  ZLHotSearchView.h
//  CategoryAndSearch
//
//  Created by 张璐 on 15/8/8.
//  Copyright (c) 2015年 zl_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLHotSearchView;

@protocol ZLHotSearchViewDelegate <NSObject>

@optional

-(void)hotSearchView:(ZLHotSearchView *)hotSearchView contentText:(NSString *)contentText;

@end

@interface ZLHotSearchView : UIView

//标题
@property (nonatomic,copy) NSString * title;
//标题的字体
@property (nonatomic,strong) UIFont * titleFont;
//标题的颜色
@property (nonatomic,strong) UIColor * titleColor;
//内容数组
@property (nonatomic,strong) NSArray * contentArray;
//内容字体
@property (nonatomic,strong) UIFont * contentFont;
//内容字体颜色
@property (nonatomic,strong) UIColor * contentColor;
//内容间距
@property (nonatomic,assign) UIEdgeInsets insets;
//内容高度
@property (nonatomic,assign) CGFloat itemHeight;
//内容背景图片
@property (nonatomic,copy) NSString * contentBackgroundImage;
//代理
@property(nonatomic,weak) id<ZLHotSearchViewDelegate> delegate;


@end
